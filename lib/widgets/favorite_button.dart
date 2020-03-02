import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget{
  int index = 0;
  FavoriteButton(this.index);
  @override
  State<StatefulWidget> createState() {
    return _FavoriteButton(index);
  }

}

class _FavoriteButton extends State<FavoriteButton>{
 bool favorite = false;
 int index = 0;
 _FavoriteButton(this.index);

  void onPRessedFav(){
    setState(() {
      favorite = !favorite;
      if(favorite){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Favorito!")));
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    final button  =  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onPRessedFav,
        child: Icon(
          favorite ? Icons.favorite: Icons.favorite_border,
          color: Colors.deepOrange,
        ) ,
      ),
    );

    return button;
  }

}