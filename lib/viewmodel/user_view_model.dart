import 'package:Placelook/domain/usecase/get_user_usecase.dart';
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
  String? _token;
  late LoginUseCase _loginUseCase = GetIt.instance<LoginUseCase>();
  late GetUserUseCase _getUserUseCase = GetIt.instance<GetUserUseCase>();
  late LoadUserUseCase _loadUserUseCase = GetIt.instance<LoadUserUseCase>();
  late SaveUserUsecase _saveUserUsecase = GetIt.instance<SaveUserUsecase>();

  User? get user => _user;
  set user(User? value) => _user = value;
  String get login => _login ?? "";
  String get password => _password ?? "";
  String get token => _token ?? "";
  set login(String value) => _login = value;
  set password(String value) => _password = value;
  set token(String? value) => _token = value;

  String get firstName => (user != null) ? user?.firstName ?? "" : "";
  String get lastName => (user != null) ? user?.lastName ?? "" : "";
  String get email => (user != null) ? user?.email ?? "" ?? "" : "";

  UserViewModel();

  Future _loginAsync() async {
    user = null;
    if (_login != null &&
        _password != null &&
        _login!.isNotEmpty &&
        _password!.isNotEmpty) {
      //var t = await _loginUseCase.load(ParamLogin(_login!, _password!));
      var t = await _loginUseCase.load(ParamLogin(_login!, _password!));
      token = t;
    } else {
      token = null;
    }
  }

  Future _getUserAsync() async {
    if (_token != null && _token!.isNotEmpty) {
      user = await _getUserUseCase.load();
      print(user.toString());
    } else {
      user = null;
    }
  }

  Future startApp() async {
    await _loginAsync();
    if (token.isNotEmpty) {
      await _getUserAsync();
    } else {
      print("Login error");
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
