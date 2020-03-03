import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/User/model/user_model.dart';

import 'package:flutter/material.dart';

class UserCompetitorCard extends StatelessWidget {
  final UserModel user;

  UserCompetitorCard({this.user});

  @override
  Widget build(BuildContext context) {
    final TextStyle styleItem =
        TextStyle(fontSize: 18, fontFamily: "Lato", color: Colors.black);
    final TextStyle styleName = TextStyle(
        fontSize: 14,
        fontFamily: "Lato",
        fontWeight: FontWeight.w500,
        color: Colors.deepOrange);
    if (user != null) {
      final image = Container(
          margin: EdgeInsets.all(5),
          child: Column(children: <Widget>[
            Hero(
              tag: "userPictureCompetitor",
              child: CachedNetworkImage(
                imageUrl: user.picture.toString(),
                imageBuilder: (context, imageProvider) => Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
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
            Text(
                '${user.name}${user.name}',
                style: styleName)
          ]));

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pushNamed(
              context,
              "/profile",
              arguments: user,
            );
          },
          child: image,
        ),
      );
    } else {
      return Container();
    }
  }
}
