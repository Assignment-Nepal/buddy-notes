import 'dart:ui';

import 'package:flutter/material.dart';



class AppColors {
  static const Color transparent = const Color(0xFFFFFF);
  static const Color whiteBackgroundColor = const Color(0xFFFFFFFF);

  static const Color primaryColor = const Color(0xFF131313);

  static const Color gray100 = const Color(0xFFF8F8F8);

}

class InToMaterialColors{
  static Map<int, Color> color =
  {
    50:Color.fromRGBO(136,14,79, .1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(136,14,79, .4),
    400:Color.fromRGBO(136,14,79, .5),
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Color.fromRGBO(136,14,79, .8),
    800:Color.fromRGBO(136,14,79, .9),
    900:Color.fromRGBO(136,14,79, 1),
  };
}