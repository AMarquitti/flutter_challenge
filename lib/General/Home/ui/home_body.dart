import 'package:flutter/material.dart';

import 'home_activity.dart';
import 'home_competitor.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        HomeActivity(),
        Container(
            margin: const EdgeInsets.all(5),
            child: Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                    onEditingComplete: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.black.withOpacity(0.05),
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Find your new motivation',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.zero)))),
        HomeCompetitor(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.only(top: 20),
          margin: const EdgeInsets.all(5),
          child: const Center(),
        )
      ],
    );
  }
}
