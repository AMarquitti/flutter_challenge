import 'package:flutter/material.dart';

class HomeCompetitor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(5),
      child: Center()
    );
  }
}