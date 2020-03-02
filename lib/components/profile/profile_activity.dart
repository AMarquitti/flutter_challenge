
import 'package:challenge/User/model/user_model.dart';
import 'package:flutter/material.dart';

@immutable
class ProfileActivity extends StatefulWidget {
  final UserModel userModel;

  ProfileActivity(this.userModel);

  @override
  _ProfileActivityState createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String activityText = widget.userModel.activity == 1 ? "Burned ${widget.userModel.calories} cal." : "Distance ${widget.userModel.distance/100} Km.";
    return Container(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Today Activity"),
                Container(
                  alignment: Alignment(0, 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepOrange),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          activityText,
                          style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
