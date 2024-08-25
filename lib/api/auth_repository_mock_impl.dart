
import 'dart:convert';
import 'package:Placelook/model/user.dart';
import 'package:flutter/services.dart';
import 'auth_repository.dart';

class AuthRepositoryMockImpl extends AuthRepository {
  @override
  Future<String?> login(String login, String password) async {
/*
    final secretKey = 'my_secret_key';
    final userId = 'user123';
    final token = AuthTokenGenerator.generateBearerToken(secretKey, userId: userId);
    print('Generated token: $token');
    return token;
*/
    String? res;
    if(password == "qwerty"){
      res = await rootBundle.loadString("assets/mock/token.txt");
    }
    print("Token from file:"+(res??"NONE"));
    return res;
  }

  @override
  Future<User?> getUser() async {
    final resp = await rootBundle.loadString("assets/mock/user.json");
    print("User rrom file:"+resp);
    var map = jsonDecode(resp);
    var u = User.fromJson(map);
    return u;
  }
}
