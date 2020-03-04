import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/User/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({this.user});

  @override
  Widget build(BuildContext context) {
    final TextStyle styleName = TextStyle(
        fontSize: 10,
        fontFamily: "Lato",
        fontWeight: FontWeight.w500,
        color: Colors.deepOrange);

    final image = Container(
        margin: const EdgeInsets.all(0),
        child: Column(children: <Widget>[
          Hero(
            tag: "userPicture",
            child: CachedNetworkImage(
              imageUrl: user.picture.medium,
              imageBuilder: (context, imageProvider) => Container(
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
              placeholder: (context, url) =>
                  Icon(Icons.person, color: Colors.grey),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text('${user.name.first} ${user.name.last}', style: styleName)
        ]));

    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Fluttertoast.showToast(
        msg: FlutterI18n.translate(context, "tips.userCard"),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
