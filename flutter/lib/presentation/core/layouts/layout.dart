import 'package:challenge/config/global_config.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../core/res/color_palette.dart';
import '../../home/widgets/home_drawer.dart';

class Layout extends StatelessWidget {
  const Layout({
    Key key,
    @required this.child,
    this.widgetTopLeft,
    this.hideTopLeft,
    this.widgetTopRight,
    this.hideTopRight,
    this.inverse = false,
    this.bottomNavigationBar,
    this.title = const SizedBox(),
    this.subtitle = const SizedBox(),
    this.drawer = false,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final Widget widgetTopLeft;
  final bool hideTopLeft;
  final Widget widgetTopRight;
  final bool hideTopRight;
  final bool inverse;
  final Widget bottomNavigationBar;
  final Widget title;
  final Widget subtitle;
  final bool drawer;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
      if (constrains.maxWidth <= 768) {
        return buildVerticalLayout(context);
      } else {
        return buildHorizontalLayout(context);
      }
    });
  }

  Widget buildVerticalLayout(BuildContext context) {
    final ReactiveModel<GlobalConfig> globalConfig = RM.get<GlobalConfig>();
    return StateBuilder<GlobalConfig>(
        observe: () => globalConfig,
        builder: (_, __) => Scaffold(
              drawer: drawer ? HomeDrawer() : null,
              bottomNavigationBar: bottomNavigationBar,
              backgroundColor: globalConfig.state.themeLight
                  ? Colors.white
                  : backgroundColor,
              body: Stack(
                children: <Widget>[
                  child,
                  title,
                  subtitle,
                  rowTopLeftRigth(),
                ],
              ),
            ));
  }

  Widget buildHorizontalLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: drawer ? HomeDrawer() : null,
      body: SafeArea(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Flexible(
                flex: 3,
                child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/img/web-bg.jpg'))),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color:Colors.black87.withOpacity(0.7)
                        ),
                        title,
                        subtitle,
                        rowTopLeftRigth(),
                      ],
                    ))),
            Flexible(
                flex: 3,
                child: Parent(
                    style: ParentStyle()
                      ..boxShadow(color: Colors.grey)
                      ..background.color(
                          inverse ? Colors.white : ColorPalette.primaryColor)
                      ..padding(all: 30)
                      ..height(double.infinity),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[const SizedBox(height: 71), child],
                      ),
                    ))),
          ])),
    );
  }

  Widget rowTopLeftRigth() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: hideTopLeft != true,
          child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20.0),
              child: widgetTopLeft),
        ),
        Visibility(
          visible: hideTopRight != false,
          child: Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 20.0),
              child: widgetTopRight),
        ),
      ],
    );
  }
}
