import 'package:challenge/components/home/home_body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeContent());
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/img/splash.png')))))),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [HomeBody()],
          )),
        ]);
  }
}
