import '../model/user.dart';

abstract class AuthRepository {
  Future<String?> login(String login, String password);
  Future<List<User?>> getUsers();
}
