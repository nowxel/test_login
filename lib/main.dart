import 'package:flutter/widgets.dart';
import 'package:test_login/packages/authentication_repository.dart';
import 'package:test_login/packages/user_repository.dart';

import 'app.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}