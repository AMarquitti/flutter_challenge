import 'package:auto_route/auto_route_wrapper.dart';
import 'package:challenge/General/Home/ui/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../config/injection/injection_config.dart';
import '../state/home_store.dart';
import 'home_activity.dart';
import 'home_body.dart';

class Home extends HookWidget with AutoRouteWrapper {
  final FocusNode _focusSearch = FocusNode();
  ScrollController useScrollController() {
    final ScrollController scrollController = ScrollController();
    _focusSearch.addListener(() {
      if (_focusSearch.hasFocus) {
        scrollController.animateTo(100,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        scrollController.animateTo(0,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
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
    final ValueNotifier<String> _langAnimation =
        useState(globalConfig.lang == "es" ? "reverse" : "forward");
    final ValueNotifier<bool> _themeLight = useState(globalConfig.themeLight);
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(FlutterI18n.translate(context, "exit.title")),
              content: Text(FlutterI18n.translate(context, "exit.body")),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(FlutterI18n.translate(context, "exit.yes")),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor:
            globalConfig.themeLight ? Colors.white : Colors.black87,
        drawer: HomeDrawer(_langAnimation, _themeLight),
        body: CustomScrollView(controller: useScrollController(), slivers: <
            Widget>[
          SliverAppBar(
            pinned: true,
            primary: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(FlutterI18n.translate(context, "home.title"),
                    style: const TextStyle(
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
              [HomeActivity(_focusSearch)],
            ),
          ),
          SliverFillViewport(
            delegate: SliverChildListDelegate(
              [HomeBody()],
            ),
          ),
        ]),
      )
    );
  }

  @override
  Widget get wrappedRoute => Injector(
      inject: [Inject<HomeStore>(() => getIt<HomeStore>())],
      builder: (_) => Home());
}
