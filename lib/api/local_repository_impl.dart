import 'dart:convert';

import 'package:Placelook/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/convertor.dart';
import 'local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  @override
  Future<User> userFromStogare() async {
    var pref = await SharedPreferences.getInstance();
    User u = User(contacts: List.empty());
    String? str = await pref.getString("profile");
    if (str != null) {
      var f = jsonDecode(str);
      //var f = null;
      if (f != null) {
        u = User.fromJson(convertMap(f));
      }
    }

    return Future<User>(() => u);
  }

  @override
  void saveUser(User u) async {
    var pref = await SharedPreferences.getInstance();
    var str = jsonEncode(u.toJson());
    await pref.setString("profile", str);
    print(u.toJson().toString());
  }
}
