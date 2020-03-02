import 'package:flutter/material.dart';

class HomeCompetitor extends StatefulWidget {
  @override
  _HomeCompetitorState createState() => _HomeCompetitorState();
}

class _HomeCompetitorState extends State<HomeCompetitor> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> userWidgets = [];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.only(top: 0),
      margin: EdgeInsets.all(5),
      child: Center()
    );
  }
}