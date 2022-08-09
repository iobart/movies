
import 'package:movies/src/domain/entities/user_model.dart';

class LoginStore {
  static final LoginStore _singleton = LoginStore._();
  factory LoginStore() => _singleton;
  LoginStore._();

  UserModel? userInformation;


  List<UserModel> userList = const [
    UserModel(
     user: 'maria',
      password: 'password'
    ),
    UserModel(
      user: 'pedro',
      password: '123456'
    ),
  ];
}
