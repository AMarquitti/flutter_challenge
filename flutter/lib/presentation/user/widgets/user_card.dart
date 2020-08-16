import 'package:cached_network_image/cached_network_image.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserCard extends StatelessWidget {
  const UserCard({this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    const TextStyle styleName = TextStyle(
        fontSize: 10,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w500,
        color: Colors.deepOrange);

    final Widget image = Container(
        margin: const EdgeInsets.all(0),
        child: Column(children: <Widget>[
          Hero(
            tag: 'userPicture',
            child: CachedNetworkImage(
              imageUrl: user.picture.medium,
              imageBuilder: (_, ImageProvider<dynamic> imageProvider) =>
                  Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (_, __) =>
                  const Icon(Icons.person, color: Colors.grey),
              errorWidget: (_, __, dynamic error) => const Icon(Icons.error),
            ),
          ),
          Text('${user.name.first} ${user.name.last}', style: styleName)
        ]));

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
      child: Stack(
        alignment: const Alignment(0.9, 0.45),
        children: <Widget>[
          image,
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.orange,
            child: Icon(
              user.activity == 0
                  ? Icons.directions_run
                  : Icons.accessibility_new,
              size: 15,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
