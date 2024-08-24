import 'package:Placelook/domain/usecase/load_user_usecase.dart';
import 'package:Placelook/domain/usecase/login_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../model/user.dart';

class UserViewModel extends ChangeNotifier{
  late User user;
  String? _login;
  String? _password;
  late LoginUseCase _loginUseCase = GetIt.instance<LoginUseCase>();
  late LoadUserUseCase _loadUserUseCase;
  Future<User?> login() async {
    if(_login != null && _password != null && _login!.isNotEmpty && _password!.isNotEmpty){
      return _loginUseCase.load(ParamLogin(_login!, _password!));
    }else{
      return null;
    }
  }
  Future<User> fromStorage(){
    return _loadUserUseCase.load(Null as Null);
  }
}