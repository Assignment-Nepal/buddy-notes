

import 'package:buddy_web/main.dart';

import 'config.dart';

void main() {
  Config.setEnvironment(env: Env.LOCAL);
  mainDelegate();
}
