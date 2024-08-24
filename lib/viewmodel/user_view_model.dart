import 'package:Placelook/domain/usecase/load_user_usecase.dart';
import 'package:Placelook/domain/usecase/login_usecase.dart';
import 'package:Placelook/domain/usecase/save_user_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../model/user.dart';

class UserViewModel extends ChangeNotifier {
  late User? user = null;
  String? _login;
  String? _password;
  late LoginUseCase _loginUseCase = GetIt.instance<LoginUseCase>();
  late LoadUserUseCase _loadUserUseCase = GetIt.instance<LoadUserUseCase>();
  late SaveUserUsecase _saveUserUsecase = GetIt.instance<SaveUserUsecase>();
  UserViewModel();

  Future<User?> login() async {
    if (_login != null &&
        _password != null &&
        _login!.isNotEmpty &&
        _password!.isNotEmpty) {
      return _loginUseCase.load(ParamLogin(_login!, _password!));
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
