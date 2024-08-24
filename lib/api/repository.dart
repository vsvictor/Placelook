import '../model/user.dart';

abstract class Repository{
  Future<User> login(String login, String password);
}