import 'dart:async';

import 'package:Placelook/model/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/semantics.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
import 'package:Placelook/model/contact.dart';
import 'package:Placelook/model/role.dart';
import 'package:Placelook/model/user.dart';

import '../utils/convertor.dart';

class UserModel extends ValueNotifier<User> {
  UserModel(super.value);

  void save() async {
    var pref = await SecureSharedPref.getInstance();
    await pref.putMap("profile", value.toJson());
    print(value.toJson().toString());
  }

  static Future<UserModel?> fromStorage() async {
    var pref = await SecureSharedPref.getInstance();
    User u = User(contacts: List.empty());
    var f = await pref.getMap("profile");
    if (f != null) {
      u = User.fromJson(convertMap(f));
    }
    return Future<UserModel>(() => UserModel(u));
  }
}
