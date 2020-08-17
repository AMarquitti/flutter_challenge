import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../config/router/routing.gr.dart';
import '../../core/res/color_palette.dart';

class Splash extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AnimationController animationController =
        useAnimationController(duration: const Duration(seconds: 2));
    animationController.forward().whenComplete(() => ExtendedNavigator.root
        .pushAndRemoveUntil(Routes.authPage, (Route<dynamic> route) => false));

    return Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: Center(
          child: Column(
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
                      decoration: const BoxDecoration(
                        color: ColorPalette.colorAccent,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/img/splash.png'),
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
                        FlutterI18n.translate(context, 'splash.title'),
                        style: const TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.colorAccent),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
