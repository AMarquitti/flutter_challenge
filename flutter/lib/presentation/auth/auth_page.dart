import 'package:auto_route/auto_route.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../application/auth/auth_state.dart';
import '../../config/injection/injection.dart';
import '../../config/router/routing.gr.dart';
import '../../core/res/color_palette.dart';
import '../core/layouts/layout.dart';
import '../core/styles/general_style.dart';
import '../core/widgets/lang_changer.dart';

class AuthPage extends HookWidget implements AutoRouteWrapper {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> _langAnimation =
        useState(globalConfig.lang == 'en' ? 'forward' : 'reverse');
    final ValueNotifier<bool> _showPassword = useState(false);
    final ValueNotifier<String> _username = useState('');
    final ValueNotifier<String> _password = useState('');

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
      return RaisedButton(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 15),
        onPressed: () {
          _formKey.currentState.save();
          submitForm(username: _username.value, password: _password.value);
        },
        color: ColorPalette.colorAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: StateBuilder<AuthState>(
          observe: () => RM.get<AuthState>(),
          builder: (BuildContext context, ReactiveModel<AuthState> state) {
            return state.whenConnectionState(
                onIdle: () => buildLoginLabel(context),
                onWaiting: () => buildCircularProgress(),
                onData: (_) => buildCircularProgress(),
                onError: (_) => buildLoginLabel(context));
          },
        ),
      );
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

    Container buildInputUsername() {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            onSaved: (String value) {
              _username.value = value;
            },
            initialValue: '',
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: FlutterI18n.translate(context, 'login.username'),
                border: InputBorder.none,
                icon: const Icon(
                  Icons.person,
                  color: ColorPalette.primaryColor,
                )),
          ));
    }

    Container buildInputPassword() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: <Widget>[
            TextFormField(
              obscureText: !_showPassword.value,
              onSaved: (String value) {
                _password.value = value;
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: FlutterI18n.translate(context, 'login.password'),
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.lock,
                    color: ColorPalette.primaryColor,
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  icon: Icon(_showPassword.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  color: ColorPalette.primaryColor,
                  onPressed: () => _showPassword.value = !_showPassword.value),
            )
          ],
        ),
      );
    }

    Container buildDivider() {
      return Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
        child: const Divider(
          color: ColorPalette.primaryColorDark,
        ),
      );
    }

    Widget buildRawMaterialButton() {
      return getLangChanger(context, _langAnimation);
    }

    Container _buildLoginForm() {
      return Container(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: RoundedDiagonalPathClipper(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 90.0),
                    buildInputUsername(),
                    buildDivider(),
                    buildInputPassword(),
                    buildDivider(),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            buildCenterLogo(),
            Container(
                height: 430,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: buildRaisedButton(),
                )),
          ],
        ),
      );
    }

    return Layout(
        title: Positioned(
            top: 100,
            left: 50,
            child: Txt(
              FlutterI18n.translate(context, 'titles.authLanding'),
              style: titleWhite,
            )),
        subtitle: Positioned(
            top: 150,
            left: 140,
            child: Txt(
              FlutterI18n.translate(context, 'subtitles.authLanding'),
              style: titleGreen,
            )),
        child: Form(
          key: _formKey,
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
                    const SizedBox(height: 50),
                    buildRawMaterialButton()
                  ])),
        ));
  }

  Text buildLoginLabel(BuildContext context) {
    return Text(FlutterI18n.translate(context, 'login.loginButton'),
        style: const TextStyle(color: Colors.black, fontSize: 16));
  }

  void submitForm({@required String username, @required String password}) {
    final ReactiveModel<AuthState> authState = RM.get<AuthState>();
    authState.setState(
        (AuthState state) =>
            state.loginUser(username: username, password: password),
        onError: (BuildContext context, dynamic error) =>
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('$error'),
              ),
            ),
        onData: (_, AuthState state) {
          ExtendedNavigator.root.pushAndRemoveUntil(
              Routes.home, (Route<dynamic> route) => false,
              arguments: HomeArguments(currentUser: state.authUser));
        });
  }

  @override
  Widget wrappedRoute(BuildContext context) => Injector(
      inject: <Injectable>[Inject<AuthState>(() => getIt<AuthState>())],
      builder: (_) => AuthPage());
}
