import 'package:flutter/material.dart';

import 'home_body.dart';

class Home extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              primary: true,
              backgroundColor: Colors.white10,
              forceElevated: true,
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("New challenges await you!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Hero(
                      tag: 'logo',
                      child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/img/splash.png')))))),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
              [HomeBody()],
            )),
          ]),
    );
  }
}

