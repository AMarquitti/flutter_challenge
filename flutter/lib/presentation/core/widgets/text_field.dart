import 'package:challenge/core/res/color_palette.dart';
import 'package:flutter/material.dart';

Widget txtField(
    {String labelText,
    bool obscureText = false,
    Widget suffixIcon,
    Widget icon,
    String hint,
    Function(String) onChanged,
    bool hasError = false,
    String initialValue = '',
    String error}) {
  return Builder(builder: (BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          style: const TextStyle(
              color: Color.fromRGBO(34, 15, 80, 1),
              fontWeight: FontWeight.bold),
          keyboardType: TextInputType.text,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: const TextStyle(
                color: Color.fromRGBO(130, 139, 159, 1),
                fontWeight: FontWeight.normal),
            labelText: labelText,
            suffixIcon: suffixIcon,
            hintText: hint,
            icon: icon,
          ),
          onChanged: onChanged,
        ),
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal:5.0),
          child:  Divider(color: ColorPalette.primaryColor),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(hasError ? '* $error' : '',
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.red, fontSize: 12)),
        )
      ],
    );
  });
}
