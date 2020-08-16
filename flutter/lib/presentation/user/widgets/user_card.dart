import 'package:cached_network_image/cached_network_image.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/res/color_palette.dart';

class UserCard extends StatelessWidget {
  const UserCard({this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Fluttertoast.showToast(
            msg: FlutterI18n.translate(context, 'tips.userCard'),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black87,
            textColor: Colors.white);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: ColorPalette.colorAccent,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 35,
          foregroundColor: Colors.white,
          backgroundImage: CachedNetworkImageProvider(user.picture.large),
        ),
      ),
    );
  }
}
