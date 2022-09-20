

import 'package:buddy_web/config/config.dart';

class Api {
  static const apiVNone = "";
  static const apiV1 = "/v1";
  static const apiV2 = "/v2";

  static String? get authority {
    return Config.BUDDY_SERVER;
  }
}
