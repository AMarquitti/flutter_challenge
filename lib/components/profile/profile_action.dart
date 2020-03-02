import 'package:challenge/User/model/user_model.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

@immutable
class ProfileAction extends StatefulWidget {
  final UserModel userModel;
  final Contact contact = Contact();
  ProfileAction(this.userModel);
  @override
  _ProfileActionState createState() => _ProfileActionState();
}

class _ProfileActionState extends State<ProfileAction> {
  @override
  void initState() {
    super.initState();
    widget.contact.displayName ="${widget.userModel}${widget.userModel} ${widget.userModel.name}${widget.userModel.name}";
    widget.contact.givenName ="${widget.userModel.name}${widget.userModel.name}";
    widget.contact.familyName ="${widget.userModel.name}${widget.userModel.name}";
    Item phone = Item(label:"Personal Phone", value: widget.userModel.phone);
    widget.contact.phones =[phone];

  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    if (permission != PermissionStatus.granted && permission != PermissionStatus.disabled) {
      Map<PermissionGroup, PermissionStatus> permissionStatus = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
      return permissionStatus[PermissionGroup.contacts] ?? PermissionStatus.unknown;
    } else {
      return permission;
    }
  }


  addContact(Contact contact) async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      ContactsService.addContact(widget.contact);
      Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          flushbarStyle: FlushbarStyle.GROUNDED,
          backgroundColor: Colors.deepOrange,
          duration: Duration(seconds: 5),
          messageText: Text(
            "${contact.displayName} added to your contacts",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          icon: Icon(
            Icons.contact_phone,
            size: 35.0,
            color: Colors.white,
          ))..show(context);
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          flushbarStyle: FlushbarStyle.GROUNDED,
          backgroundColor: Colors.deepOrange,
          duration: Duration(seconds: 5),
          messageText: Text(
            "CONTACT PERMISSION DENIED",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          icon: Icon(
            Icons.lock,
            size: 35.0,
            color: Colors.white,
          ))..show(context);
    } else if (permissionStatus == PermissionStatus.disabled) {
      Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          flushbarStyle: FlushbarStyle.GROUNDED,
          backgroundColor: Colors.deepOrange,
          duration: Duration(seconds: 5),
          messageText: Text(
            "CONTACT PERMISSION_DISABLED" ,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          icon: Icon(
            Icons.lock,
            size: 35.0,
            color: Colors.white,
          ))..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool competitor = false;
    return Container(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(elevation: 2, color: Colors.deepOrange, textColor: Colors.white, onPressed: (){
                addContact(widget.contact);
              }, icon: Icon(Icons.perm_contact_calendar), label: Text("Add Contact")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(elevation: 2, color: Colors.deepOrange, textColor: Colors.white, onPressed: (){
                Flushbar(
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    backgroundColor: Colors.deepOrange,
                    duration: Duration(seconds: 5),
                    messageText: Text(
                      competitor ? "Competitor removed successfully." : "Competitor added successfully." ,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.star,
                      size: 35.0,
                      color: Colors.white,
                    ))..show(context);
                    setState(() {});
                }, icon: competitor ? Icon(Icons.star) : Icon(Icons.star_border) , label: competitor ? Text("Remove Competitor") : Text("Add Competitor") ),
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
