import 'package:Placelook/api/remote_repository.dart';
import 'package:Placelook/model/walk.dart';
import '../model/profile.dart';
import '../model/user.dart';
import 'local_repository.dart';

class Repository {
  final RemoteRepository _remote;
  final LocalRepository _local;
  Repository(this._remote, this._local);
  Future<String?> login(String login, String password) =>
      _remote.login(login, password);
  Future<List<Profile?>?> getProfiles() => _remote.getProfiles();
  Future<Profile> profileFromStogare() => _local.profileFromStogare();
  void saveProfile(Profile u) => _local.saveProfile(u);
  Future<List<Walk>?> getAllWalks() => _remote.getAllWalks();
  Future<User?> addUser(User user) => _remote.addUser(user);
}
