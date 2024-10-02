import 'dart:async';
import 'dart:convert';
import 'package:Placelook/model/profile.dart';
import 'package:flutter/services.dart';
import 'auth_repository.dart';

class AuthRepositoryMockImpl extends AuthRepository {
  @override
  Future<String?> login(String login, String password) async {
    String? res;
    if (password == "qwerty") {
      res = await rootBundle.loadString("assets/mock/token.txt");
    }
    print("Token from file:${res ?? "NONE"}");
    return res;
  }

  @override
  Future<List<Profile?>?> getProfiles() async {
    final resp = await rootBundle.loadString("assets/mock/profiles.json");
    var map = jsonDecode(resp);
    return List.from(map.map((e) => Profile.fromJson(e)));
  }
}
