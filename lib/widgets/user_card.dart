import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/User/model/user_model.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  UserCard({this.user});

  @override
  Widget build(BuildContext context) {
    final TextStyle styleName = TextStyle(
        fontSize: 14,
        fontFamily: "Lato",
        fontWeight: FontWeight.w500,
        color: Colors.deepOrange);
    if (user != null) {
      final image = Container(
          margin: EdgeInsets.all(0),
          child: Column(children: <Widget>[
            Hero(
              tag: "userPicture",
              child: CachedNetworkImage(
                imageUrl: user.picture.toString(),
                imageBuilder: (context, imageProvider) => Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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

      return InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.pushNamed(
            context,
            "/profile",
            arguments: user,
          );
        },
        child: Stack(
          alignment: Alignment(0.9, 0.45),
          children: <Widget>[
            image,
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.orange,
              child: Icon(
                user.name == 0
                    ? Icons.directions_run
                    : Icons.accessibility_new,
                size: 15,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
