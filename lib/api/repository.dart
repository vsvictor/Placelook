import 'package:Placelook/api/LocalRepository.dart';
import 'package:Placelook/api/remote_repository.dart';

import '../model/user.dart';

class Repository{
  RemoteRepository _remote;
  LocalRepository _local;
  Repository(this._remote, this._local);
  Future<User> login(String login, String password) => _remote.login(login, password);
}