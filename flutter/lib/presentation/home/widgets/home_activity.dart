import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../application/home/home_state.dart';
import '../../../config/injection/injection.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity(this._focusSearch);

  final FocusNode _focusSearch;

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<HomeState> homeModel = RM.get<HomeState>();
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ActionChip(
              elevation: 1,
              backgroundColor: Colors.deepOrange,
              label: Container(
                  width: 75,
                  child: Text(
                      FlutterI18n.translate(context, 'home.activity.all'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white))),
              onPressed: () => homeModel.setState((HomeState state) =>
                  state.filterUsersByActivity(activity: -1))),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: ActionChip(
              backgroundColor: Colors.deepOrange,
              label: Container(
                  width: 75,
                  child: Text(
                      FlutterI18n.translate(context, 'home.activity.runners'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white))),
              onPressed: () => homeModel.setState((HomeState state) =>
                  state.filterUsersByActivity(activity: 0))),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: ActionChip(
              backgroundColor: Colors.deepOrange,
              label: Container(
                  width: 75,
                  child: Text(
                      FlutterI18n.translate(context, 'home.activity.aerobic'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white))),
              onPressed: () => homeModel.setState((HomeState state) =>
                  state.filterUsersByActivity(activity: 1))),
        ),
      ]),
      Container(
          decoration: BoxDecoration(
            color: globalConfig.themeLight ? Colors.black12 : Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
              focusNode: _focusSearch,
              onChanged: (String name) => homeModel
                  .setState((HomeState state) => state.filterUsers(name: name)),
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: FlutterI18n.translate(context, 'home.searchHolder'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero)))
    ]);
  }
}
