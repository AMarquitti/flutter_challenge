import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/User/model/user_model.dart';
import 'package:challenge/components/profile/profile_action.dart';
import 'package:challenge/components/profile/profile_activity.dart';
import 'package:flutter/material.dart';

@immutable
class ProfileBody extends StatefulWidget {
  final UserModel userModel;

  ProfileBody(this.userModel);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final suggestionTextController = TextEditingController();

    TextStyle textStyle = TextStyle(fontFamily: "Lato", fontSize: 20);
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Container(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Hero(
                      tag: "userPicture${widget.userModel.id}",
                      child: CachedNetworkImage(
                        imageUrl: widget.userModel.picture.toString(),
                        imageBuilder: (context, imageProvider) => Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        placeholder: (context, url) =>
                            Icon(Icons.person, color: Colors.grey),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )),
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  )),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      alignment: Alignment(0, 1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.orange,
                            child: Icon(
                              widget.userModel.activity == 0
                                  ? Icons.directions_run
                                  : Icons.accessibility_new,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${widget.userModel.dob.age.toString()} ${widget.userModel.name}${widget.userModel.name} ${widget.userModel.name}${widget.userModel.name}",
                            style: TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      alignment: Alignment(0, 1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.orange,
                            child: Icon(Icons.phone,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${widget.userModel.phone}",
                            style: TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      alignment: Alignment(0, 1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.orange,
                            child: Icon(Icons.mail,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${widget.userModel.email}",
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      ProfileActivity(widget.userModel),
      ProfileAction(widget.userModel)
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
