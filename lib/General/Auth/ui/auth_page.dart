import 'package:auto_route/auto_route_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../config/injection/injection_config.dart';
import '../../../config/router/routing.gr.dart';
import '../../../core/res/color_palette.dart';
import '../../../core/widgets/lang_changer.dart';
import '../state/auth_store.dart';

class AuthPage extends HookWidget with AutoRouteWrapper {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> _langAnimation = useState(globalConfig.lang == "en" ? "reverse" : "forward");
    final ValueNotifier<bool> _showPassword = useState(false);
    final ValueNotifier<String> _username = useState("");
    final ValueNotifier<String> _password = useState("");

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
        color: ColorPalette.primary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: StateBuilder<AuthStore>(
          models: [Injector.getAsReactive<AuthStore>()],
          builder: (context, reactiveModel) {
            return reactiveModel.whenConnectionState(
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
            color: Colors.deepOrange,
            shape: BoxShape.circle,
          ),
          child: const Hero(
              tag: 'logo',
              child: CircleAvatar(
                foregroundColor: Colors.white,
                backgroundImage: AssetImage("assets/img/splash.png"),
              )),
        ),
      );
    }

    Container buildInputUsername() {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            onSaved: (value) {
              _username.value = value;
            },
            initialValue: "",
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: FlutterI18n.translate(context, "login.username"),
                border: InputBorder.none,
                icon: Icon(
                  Icons.person,
                  color: ColorPalette.primary,
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
              onSaved: (value) {
                _password.value = value;
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: FlutterI18n.translate(context, "login.password"),
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.lock,
                    color: ColorPalette.primary,
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  icon: Icon(_showPassword.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  color: ColorPalette.primary,
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
          color: ColorPalette.primaryDark,
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

    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: const AssetImage("assets/img/splash_vertical.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop)),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLoginForm(),
                const SizedBox(height: 50),
                buildRawMaterialButton()
              ])),
    ));
  }

  Text buildLoginLabel(BuildContext context) {
    return Text(FlutterI18n.translate(context, "login.loginButton"),
        style: const TextStyle(color: Colors.white, fontSize: 16));
  }

  void submitForm({@required String username, @required String password}) {
    final reactiveModel = Injector.getAsReactive<AuthStore>();
    reactiveModel.setState(
        (store) => store.loginUser(username: username, password: password),
        onError: (context, error) => Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("$error"),
              ),
            ),
        onData: (_, data) {
          Router.navigator
              .pushNamedAndRemoveUntil(Router.homePage, (_) => false);
        });
  }

  @override
  Widget get wrappedRoute => Injector(
      inject: [Inject<AuthStore>(() => getIt<AuthStore>())],
      builder: (_) => AuthPage());
}
