import '../model/user.dart';

abstract class UserRepository {
  Future<User?> addUser(User user);
}
