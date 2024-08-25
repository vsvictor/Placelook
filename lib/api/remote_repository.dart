import 'package:Placelook/model/user.dart';
import 'auth_repository.dart';

class RemoteRepository {
  AuthRepository _authRepository;
  RemoteRepository(this._authRepository);
  Future<String?> login(String login, String password) => _authRepository.login(login, password);
  Future<User?> getUser() =>
      _authRepository.getUser();
}
