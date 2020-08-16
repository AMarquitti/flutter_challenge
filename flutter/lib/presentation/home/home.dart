import 'package:auto_route/auto_route.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:challenge/presentation/home/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../application/home/home_state.dart';
import '../../config/injection/injection.dart';
import '../core/layouts/layout.dart';
import '../core/widgets/app_buttom_bar.dart';
import 'widgets/home_header.dart';

class Home extends StatelessWidget implements AutoRouteWrapper {
  const Home({Key key, this.currentUser}) : super(key: key);
  final UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(FlutterI18n.translate(context, 'exit.title')),
              content: Text(FlutterI18n.translate(context, 'exit.body')),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(FlutterI18n.translate(context, 'exit.yes')),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Layout(
            bottomNavigationBar:
                const AppBottomBar(currentIndex: AppBottomBarContent.home),
            drawer: true,
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[HomeHeader(), HomeBody()],
            ))));
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    final HomeState _homeState = getIt<HomeState>();
    _homeState.currentUser = currentUser;
    return Injector(
        initState: () {},
        inject: <Injectable>[Inject<HomeState>(() => _homeState)],
        builder: (_) => Home(currentUser: currentUser));
  }
}
