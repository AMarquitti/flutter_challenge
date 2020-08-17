import 'package:cached_network_image/cached_network_image.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:challenge/presentation/core/styles/general_style.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../application/home/home_state.dart';
import '../../../core/res/color_palette.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    final UserModel user = RM.get<HomeState>().state.currentUser;
    return Container(
      height: _screen.height * 0.4,
      color: ColorPalette.primaryColor,
      child: Stack(children: <Widget>[
        Positioned(
            top: 20,
            right: -100,
            child: Image.asset(
              'assets/img/line_green_small.png',
              scale: 1,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Txt(
                      '296',
                      style: userNameStyle.clone()..fontSize(16),
                    ),
                    Txt(
                      '/400',
                      style: userNameStyle.clone()
                        ..textColor(ColorPalette.colorAccent)
                        ..fontFamily('raleway-bold')
                        ..fontSize(20),
                    ),
                  ],
                ),
                buildCenterLogo(),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 50),
            Txt(
              '${user.name.last} ${user.name.first}',
              style: userNameStyle,
            ),
            Txt(
              'Level 4',
              style: userNameStyle.clone()
                ..textColor(ColorPalette.colorAccent)
                ..fontSize(18)
                ..textShadow(blur: 5),
            )
          ],
        ),
      ]),
    );
  }

  Center buildCenterLogo() {
    final UserModel user = RM.get<HomeState>().state.currentUser;
    return Center(
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: ColorPalette.colorAccent,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          foregroundColor: Colors.white,
          backgroundImage: CachedNetworkImageProvider(user.picture.large),
        ),
      ),
    );
  }
}
