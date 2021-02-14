import 'package:auto_route/auto_route.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../application/auth/auth_state.dart';
import '../../config/injection/injection.dart';
import '../../config/router/routing.gr.dart';
import '../../core/res/color_palette.dart';
import '../../domain/auth/failures/auth_value_object_failure.dart';
import '../../domain/auth/value_objects/auth_value_object.dart';
import '../../domain/core/failures/value_object_failure.dart';
import '../core/layouts/layout.dart';
import '../core/styles/general_style.dart';
import '../core/widgets/lang_changer.dart';
import '../core/widgets/text_field.dart';

class AuthPage extends StatelessWidget implements AutoRouteWrapper {
  const AuthPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return Layout(
        title: Positioned(
            top: _screen.height * 0.10,
            left: _screen.width * 0.05,
            child: Txt(
              FlutterI18n.translate(context, 'titles.authLanding'),
              style: titleWhite,
            )),
        subtitle: Positioned(
            top: _screen.height * 0.16,
            left: _screen.width * 0.35,
            child: Txt(
              FlutterI18n.translate(context, 'subtitles.authLanding'),
              style: titleGreen,
            )),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: const AssetImage('assets/img/grey-bg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop)),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 100),
                  _buildLoginForm(),
                  const SizedBox(height: 30),
                  getLangChanger()
                ])));
  }

  SizedBox buildCircularProgress() {
    return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 2.0,
        ));
  }

  Widget buildRaisedButton() {
    final ReactiveModel<AuthState> _authState = RM.get<AuthState>();
    return Builder(builder: (BuildContext context) {
      return RaisedButton(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 15),
        onPressed: () => submitForm(context),
        color: ColorPalette.colorAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: StateBuilder<AuthState>(
          observe: () => _authState,
          builder: (BuildContext context, ReactiveModel<AuthState> state) {
            final Widget loginButton = buildLoginLabel(context);
            return state.whenConnectionState(
                onIdle: () => loginButton,
                onWaiting: () => buildCircularProgress(),
                onData: (_) => loginButton,
                onError: (_) => loginButton);
          },
        ),
      );
    });
  }

  Center buildCenterLogo() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: ColorPalette.colorAccent,
          shape: BoxShape.circle,
        ),
        child: const Hero(
            tag: 'logo',
            child: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundImage: AssetImage('assets/img/splash.png'),
            )),
      ),
    );
  }

  Widget buildInputUsername() => Builder(builder: (BuildContext context) {
        final ReactiveModel<AuthState> _authState = RM.get<AuthState>();
        return StateBuilder<AuthState>(
            observe: () => _authState,
            builder: (_, __) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TxtField(
                  hint: FlutterI18n.translate(context, 'login.username'),
                  icon: const Icon(
                    Icons.lock,
                    color: ColorPalette.primaryColor,
                  ),
                  hasError: _authState.state.isSubmitted &&
                      !_authState.state.username.isValid(),
                  error: _authState.state.username.getError() is InvalidUsername
                      ? FlutterI18n.translate(
                          context, 'login.errors.invalidUsername')
                      : '',
                  onChanged: (String value) {
                    _authState.setState(
                        (AuthState s) => s.username = Username(value));
                  },
                )));
      });

  Widget buildInputPassword() => Builder(builder: (BuildContext context) {
        final ReactiveModel<AuthState> _authState = RM.get<AuthState>();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: StateBuilder<AuthState>(
            observe: () => _authState,
            builder: (_, __) => Stack(
              children: <Widget>[
                TxtField(
                  obscureText: !_authState.state.showPassword,
                  hint: FlutterI18n.translate(context, 'login.password'),
                  icon: const Icon(
                    Icons.lock,
                    color: ColorPalette.primaryColor,
                  ),
                  hasError: _authState.state.isSubmitted &&
                      !_authState.state.password.isValid(),
                  error: _authState.state.password
                      .getError<AuthValueObjectFailure>()
                      ?.maybeWhen(
                          invalidPassword: () => FlutterI18n.translate(
                              context, 'login.errors.invalidPassword'),
                          shortPassword: () => FlutterI18n.translate(
                              context, 'login.errors.shortPassword'),
                          orElse: () => ''),
                  onChanged: (String value) {
                    _authState.setState(
                        (AuthState f) => f.password = Password(value));
                  },
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      icon: Icon(_authState.state.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: ColorPalette.primaryColor,
                      onPressed: () {
                        _authState.setState((AuthState s) =>
                            s.showPassword = !_authState.state.showPassword);
                      },
                    )),
              ],
            ),
          ),
        );
      });

  Container buildDivider() {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: const Divider(
        color: ColorPalette.primaryColorDark,
      ),
    );
  }

  Container _buildLoginForm() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 50),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50.0),
                  buildInputUsername(),
                  buildInputPassword(),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
          buildCenterLogo(),
          Container(
              height: 390,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: buildRaisedButton(),
              )),
        ],
      ),
    );
  }

  Text buildLoginLabel(BuildContext context) {
    return Text(FlutterI18n.translate(context, 'login.loginButton'),
        style: const TextStyle(color: Colors.black, fontSize: 16));
  }

  void submitForm(BuildContext context) {
    final ReactiveModel<AuthState> authState = RM.get<AuthState>();
    authState.setState((AuthState state) => state.loginUser().then(
        (Either<ValueObjectFailure, UserModel> result) => result.fold(
            (ValueObjectFailure l) => Scaffold.of(context)
                .showSnackBar(const SnackBar(content: Text('error'))),
            (UserModel user) => ExtendedNavigator.root.pushAndRemoveUntil(
                Routes.homePage, (Route<dynamic> route) => false))));
  }

  @override
  Widget wrappedRoute(BuildContext context) => Injector(
      inject: <Injectable>[Inject<AuthState>(() => getIt<AuthState>())],
      builder: (_) => const AuthPage());
}
