
import '../model/user.dart';

abstract class UserRepository{
  void addUser(User user, callback(User u));
}