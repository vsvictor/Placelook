import 'package:Placelook/api/user_repository.dart';
import 'package:Placelook/api/walk_repository.dart';
import 'package:Placelook/model/profile.dart';
import 'package:Placelook/model/walk.dart';
import '../model/user.dart';
import 'auth_repository.dart';

class RemoteRepository {
  final AuthRepository _authRepository;
  final WalkRepository _walkRepository;
  final UserRepository _userRepository;
  RemoteRepository(
      this._authRepository, this._walkRepository, this._userRepository);

  Future<String?> login(String login, String password) =>
      _authRepository.login(login, password);
  Future<List<Profile?>?> getProfiles() => _authRepository.getProfiles();
  Future<List<Walk>?> getAllWalks() => _walkRepository.getAllWalks();
  Future<User?> addUser(User user) => _userRepository.addUser(user);
}
