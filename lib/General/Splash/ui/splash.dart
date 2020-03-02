import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../config/router/routing.gr.dart';
import '../hooks/initialize_dependencies_hook.dart';

class Splash extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useInitializeDependencies();
    final AnimationController animationController =
        useAnimationController(duration: const Duration(seconds: 2));
    animationController.forward().whenComplete(
        () => Router.navigator.pushNamedAndRemoveUntil(Router.authPage,  (Route<dynamic> route) => false));

    return Scaffold(
        appBar: null,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeTransition(
                  opacity: animationController,
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      width: 200,
                      height: 200,
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            const AssetImage("assets/img/splash.png"),
                      ),
                    ),
                  )),
              FadeTransition(
                  opacity: animationController,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      alignment: const Alignment(0, 1),
                      child: Text(
                        FlutterI18n.translate(context, "splash.title"),
                        style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
