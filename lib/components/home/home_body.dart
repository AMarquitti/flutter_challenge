import 'package:challenge/User/model/user_model.dart';
import 'package:challenge/widgets/user_card.dart';
import 'package:flutter/material.dart';

import 'home_activity.dart';
import 'home_competitor.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    TextEditingController _searchValueText = TextEditingController();
    FocusNode _inputFocus = FocusNode();
    _inputFocus.addListener(() {
      if (!_inputFocus.hasFocus) {
        if(_searchValueText != null)
        _searchValueText.text = null;
      }else{
      }
    });
    _searchValueText.addListener((){
    });
    final List<Widget> userWidgets = [];
    return Container(
        height: screenHeight - 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HomeActivity(),
            Container(
                margin: EdgeInsets.all(5),
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: _searchValueText,
                      focusNode: _inputFocus,
                        onEditingComplete: () {
                        _searchValueText.text = "";
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
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.all(5),
              child: StreamBuilder<List<UserModel>>(
                builder: (BuildContext context,
                    AsyncSnapshot<List<UserModel>> snapshot) {
                  if (snapshot.data != null) {
                    userWidgets.clear();
                    snapshot.data.forEach((userData) {
                      userWidgets.add(UserCard(user: userData));
                    });
                    return Container(
                        height: screenHeight,
                        child: GridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 4,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 350),
                            children: <Widget>[...userWidgets]));
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.blue)),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ));
  }
}
