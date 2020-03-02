import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final header = Hero(
        tag: 'logo',
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/splash.png')))));

    return Stack(
      children: <Widget>[header],
    );
  }
}
