

import 'package:Placelook/model/user.dart';
import 'package:Placelook/viewmodel/user_model;.dart';

import 'auth_repository.dart';

class RemoteRepository{
  AuthRepository _authRepository;
  RemoteRepository(this._authRepository);

  Future<User> login(String login, String password) => _authRepository.login(login, password);
}