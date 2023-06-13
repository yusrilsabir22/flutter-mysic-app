import 'package:flutter/material.dart';

import 'colors.dart';

const bold = "bold";
const regular = "regular";

defaultTextStyle({family = regular, double? size = 14.0, color = whiteColor}) {
  return TextStyle(fontSize: size, color: whiteColor, fontFamily: family);
}
