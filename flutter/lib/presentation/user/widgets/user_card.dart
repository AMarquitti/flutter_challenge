import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../../config/router/routing.gr.dart';
import '../../../core/res/color_palette.dart';

class UserCard extends StatelessWidget {
  const UserCard({this.user, this.radius = 36});
  final UserModel user;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ExtendedNavigator.root.push(Routes.profilePage,
            arguments: ProfilePageArguments(currentUser: user));
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
          color: ColorPalette.colorAccent,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: radius,
          foregroundColor: Colors.white,
          backgroundImage: CachedNetworkImageProvider(user.picture.large),
        ),
      ),
    );
  }
}
