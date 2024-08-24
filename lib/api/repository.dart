
import 'package:Placelook/api/remote_repository.dart';
import 'package:Placelook/viewmodel/user_model;.dart';
import '../model/user.dart';
import 'local_repository.dart';

class Repository{
  RemoteRepository _remote;
  LocalRepository _local;
  Repository(this._remote, this._local);
  Future<User> login(String login, String password) => _remote.login(login, password);
  Future<User> userFromStogare() => _local.userFromStogare();
}