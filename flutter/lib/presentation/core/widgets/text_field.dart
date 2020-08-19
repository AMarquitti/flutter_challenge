import 'package:challenge/core/res/color_palette.dart';
import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  const TxtField(
      {Key key,
      this.labelText,
      this.obscureText = false,
      this.suffixIcon,
      this.icon,
      this.hint,
      this.onChanged,
      this.hasError = false,
      this.initialValue = '',
      this.error})
      : super(key: key);

  final String labelText;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget icon;
  final String hint;
  final Function(String) onChanged;
  final bool hasError;
  final String initialValue;
  final String error;

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Divider(color: ColorPalette.primaryColor),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(hasError ? '* $error' : '',
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.red, fontSize: 12)),
        )
      ],
    );
  }
}
