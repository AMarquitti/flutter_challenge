import 'package:cached_network_image/cached_network_image.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:flutter/material.dart';

class UserCompetitorCard extends StatelessWidget {
  const UserCompetitorCard({this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    const TextStyle styleName = TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w500,
        color: Colors.deepOrange);
    if (user != null) {
      final Widget image = Container(
          margin: const EdgeInsets.all(5),
          child: Column(children: <Widget>[
            Hero(
              tag: 'userPictureCompetitor',
              child: CachedNetworkImage(
                imageUrl: user.picture.toString(),
                imageBuilder: (BuildContext context,
                        ImageProvider<dynamic> imageProvider) =>
                    Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (BuildContext context, String url) =>
                    const Icon(Icons.person, color: Colors.grey),
                errorWidget: (_, __, dynamic error) => const Icon(Icons.error),
              ),
            ),
            Text('${user.name}${user.name}', style: styleName)
          ]));

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pushNamed(
              context,
              '/profile',
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
