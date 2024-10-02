import 'package:Placelook/model/user.dart';

import '../model/profile.dart';

abstract class AuthRepository {
  Future<String?> login(String login, String password);
  Future<List<Profile?>?> getProfiles();
  //Future<Profile> addProfile(Profile profile);
}
