import '../model/profile.dart';

abstract class LocalRepository {
  Future<Profile> profileFromStogare();
  void saveProfile(Profile u);
}
