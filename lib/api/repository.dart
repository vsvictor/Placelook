import 'package:Placelook/api/remote_repository.dart';
import '../model/user.dart';
import 'local_repository.dart';

class Repository {
  RemoteRepository _remote;
  LocalRepository _local;
  Repository(this._remote, this._local);
  Future<User?> login(String login, String password) =>
      _remote.login(login, password);
  Future<User> userFromStogare() => _local.userFromStogare();
  void saveUser(User u) => _local.saveUser(u);
}
