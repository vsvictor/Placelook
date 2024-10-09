import 'dart:convert';

import 'package:Placelook/model/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/convertor.dart';
import 'local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  @override
  Future<Profile> profileFromStogare() async {
    var pref = await SharedPreferences.getInstance();
    Profile u = Profile(contacts: List.empty());
    String? str = await pref.getString("profile");
    if (str != null) {
      var f = jsonDecode(str);
      if (f != null) {
        u = Profile.fromJson(convertMap(f));
      }
    }

    return Future<Profile>(() => u);
  }

  @override
  void saveProfile(Profile u) async {
    var pref = await SharedPreferences.getInstance();
    var str = jsonEncode(u.toJson());
    await pref.setString("profile", str);
    print(u.toJson().toString());
  }
}
