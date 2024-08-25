import 'package:Placelook/domain/usecase/load_user_usecase.dart';
import 'package:Placelook/domain/usecase/login_usecase.dart';
import 'package:Placelook/domain/usecase/save_user_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../model/user.dart';

class UserViewModel extends ChangeNotifier {
  late User? _user = null;
  String? _login;
  String? _password;
  late LoginUseCase _loginUseCase = GetIt.instance<LoginUseCase>();
  late LoadUserUseCase _loadUserUseCase = GetIt.instance<LoadUserUseCase>();
  late SaveUserUsecase _saveUserUsecase = GetIt.instance<SaveUserUsecase>();

  User? get user => _user;
  set user(User? value) => _user = value;
  String get login => _login??"";
  String get password => _password??"";
  set login(String value) => _login = value;
  set password(String value) => _password = value;

  UserViewModel();

  Future<User?> loginAsync() async {
    if (_login != null &&
        _password != null &&
        _login!.isNotEmpty &&
        _password!.isNotEmpty) {
      var res = _loginUseCase.load(ParamLogin(_login!, _password!));
      return res;
    } else {
      return null;
    }
  }

  void fromStorage() {
    _loadUserUseCase.load().then((User? u) => {
          if (u != null) {user = u, notifyListeners()}
        });
  }

  void save() {
    if (user != null) {
      _saveUserUsecase.load(user!);
    }
  }
}
