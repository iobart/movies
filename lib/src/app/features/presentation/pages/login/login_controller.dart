import 'package:flutter/material.dart';
import 'package:movies/src/app/widgets/snackbar_alert.dart';
import 'login_store.dart';

class LoginController {
  late BuildContext _context;
  late TextEditingController inputController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginStore _store = LoginStore();
  static final LoginController _singleton = LoginController._();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  factory LoginController(BuildContext context) =>
      _singleton._instance(context);

  LoginController._();

  LoginController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  void init() {
    inputController = TextEditingController();
    passwordController = TextEditingController();
  }

  void onLoginWithCredentials() async {
    if (formKey.currentState!.validate()) {
      final existUser = _store.userList
          .where((element) =>
              element.user == inputController.text &&
              element.password == passwordController.text)
          .toList();
      if (existUser.isNotEmpty) {
        Navigator.pushNamed(_context, '/home');
      } else {
        alertError('User or password is incorrect');
      }
    }
  }
  void alertError(String message) {
    SnackBarFloating.show(_context, message, type: TypeAlert.error);
  }
  void dispose() {
    inputController.dispose();
    passwordController.dispose();
  }
}
