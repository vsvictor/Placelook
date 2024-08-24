
import '../model/user.dart';

abstract class LocalRepository{
  Future<User> userFromStogare();
}