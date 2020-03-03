import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../state/home_store.dart';

class HomeActivity extends StatelessWidget {
  final ReactiveModel<HomeStore> homeModel =
      Injector.getAsReactive<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActionChip(
                  elevation: 1,
                  backgroundColor: Colors.deepOrange,
                  label: Container(
                      width: 75,
                      child: Text("All",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white))),
                  onPressed: () =>  homeModel.setState((store) => store.filterUsersByActivity(activity: -1))),
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
                  onPressed: () =>  homeModel.setState((store) => store.filterUsersByActivity(activity: 0))),
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
                  onPressed: () =>  homeModel.setState((store) => store.filterUsersByActivity(activity: 1))),
            ),
          ]),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
              onChanged: (name) =>
                  homeModel.setState((store) => store.filterUsers(name: name)),
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              decoration: InputDecoration(
                  fillColor: Colors.black.withOpacity(0.05),
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your new motivation',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero)))
    ]);
  }
}
