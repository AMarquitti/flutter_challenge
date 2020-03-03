import 'package:auto_route/auto_route_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../config/injection/injection_config.dart';
import '../state/home_store.dart';
import 'home_activity.dart';
import 'home_body.dart';

class Home extends StatelessWidget with AutoRouteWrapper {

  ScrollController useScrollController() {
    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      final bool isEnd = scrollController.offset > 120;
      if (isEnd) {
        scrollController.animateTo(100,
            duration: const Duration(milliseconds: 1000), curve: Curves.ease);
      }
    });
    return scrollController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          CustomScrollView(controller: useScrollController(), slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          primary: true,
          expandedHeight: 150.0,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("New challenges await you!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
              background: Hero(
                  tag: 'logo',
                  child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/img/splash.png')))))),
        ),
        SliverFixedExtentList(
          itemExtent: 125.0,
          delegate: SliverChildListDelegate(
            [HomeActivity()],
          ),
        ),
        SliverFillViewport(
          delegate: SliverChildListDelegate(
            [HomeBody()],
          ),
        ),
      ]),
    );
  }

  @override
  Widget get wrappedRoute => Injector(
      inject: [Inject<HomeStore>(() => getIt<HomeStore>())],
      builder: (_) => Home());
}
