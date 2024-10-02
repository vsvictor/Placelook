import 'package:Placelook/api/remote_repository.dart';
import 'package:Placelook/model/walk.dart';
import '../model/profile.dart';
import 'local_repository.dart';

class Repository {
  final RemoteRepository _remote;
  final LocalRepository _local;
  Repository(this._remote, this._local);
  Future<String?> login(String login, String password) =>
      _remote.login(login, password);
  Future<List<Profile?>?> getUsers() => _remote.getProfiles();
  Future<Profile> userFromStogare() => _local.profileFromStogare();
  void saveUser(Profile u) => _local.saveProfile(u);
  Future<List<Walk>?> getAllWalks() => _remote.getAllWalks();
}
