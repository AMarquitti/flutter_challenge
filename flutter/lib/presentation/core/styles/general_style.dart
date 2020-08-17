import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../../core/res/color_palette.dart';

final TxtStyle titleWhite = TxtStyle()
  ..fontFamily('raleway-bold')
  ..textColor(Colors.white)
  ..fontSize(48);

final TxtStyle titleGreen = TxtStyle()
  ..fontWeight(FontWeight.w700)
  ..textColor(ColorPalette.colorAccent)
  ..fontSize(48);

final TxtStyle userNameStyle = TxtStyle()
  ..fontFamily('raleway-bold')
  ..textColor(Colors.white)
  ..fontSize(24);

final TxtStyle subtitleStyle = TxtStyle()
  ..textColor(ColorPalette.subtitle)
  ..fontSize(20);

final TxtStyle subtitleCardStyle = TxtStyle()
  ..textColor(ColorPalette.white)
  ..fontSize(12);
