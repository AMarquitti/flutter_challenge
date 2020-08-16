import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key key, this.index}) : super(key: key);
  final int index;
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool favorite = false;
  void onPRessedFav() {
    setState(() {
      favorite = !favorite;
      if (favorite) {
        Scaffold.of(context)
            .showSnackBar(const SnackBar(content: Text('Favorito!')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onPRessedFav,
        child: Icon(
          favorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
