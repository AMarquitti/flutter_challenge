import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget{
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ActionChip(
                elevation: 1,
                backgroundColor:Colors.deepOrange,
                label: Container(
                    width: 75,
                    child: Text("All",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
                onPressed: () {
                  setState(() {});
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: ActionChip(
                backgroundColor: Colors.deepOrange,
                label: Container(
                    width: 75,
                    child: Text("Runners",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
                onPressed: () {
                  setState(() {});
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: ActionChip(
                backgroundColor: Colors.deepOrange,
                label: Container(
                    width: 75,
                    child: Text("Aerobic",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
                onPressed: () {
                  setState(() {});
                }),
          ),
        ]);
  }
}