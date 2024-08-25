import 'package:Placelook/api/remote_repository.dart';
import 'package:Placelook/model/walk.dart';
import '../model/user.dart';
import 'local_repository.dart';

class Repository {
  RemoteRepository _remote;
  LocalRepository _local;
  Repository(this._remote, this._local);
  Future<String?> login(String login, String password) => _remote.login(login, password);
  Future<User?> getUser() =>
      _remote.getUser();
  Future<User> userFromStogare() => _local.userFromStogare();
  void saveUser(User u) => _local.saveUser(u);
  Future<List<Walk>?> getAllWalks() => _remote.getAllWalks();
}
