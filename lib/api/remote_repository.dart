import 'package:Placelook/api/walk_repository.dart';
import 'package:Placelook/model/user.dart';
import 'package:Placelook/model/walk.dart';
import 'auth_repository.dart';

class RemoteRepository {
  AuthRepository _authRepository;
  WalkRepository _walkRepository;
  RemoteRepository(this._authRepository, this._walkRepository);
  Future<String?> login(String login, String password) =>
      _authRepository.login(login, password);
  Future<User?> getUser() => _authRepository.getUser();
  Future<List<Walk>?> getAllWalks() => _walkRepository.getAllWalks();
}
