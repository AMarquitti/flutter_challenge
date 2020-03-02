import 'package:challenge/User/model/user_model.dart';
import 'package:challenge/components/profile/profile_body.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final UserModel userModel;
  const Profile(this.userModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text("${userModel.name}${userModel.name} Profile"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 150), child: ProfileBody(userModel)),
        ));
  }
}
