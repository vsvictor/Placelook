import 'dart:convert';
import 'dart:io';
import 'package:Placelook/model/contact.dart';
import 'package:Placelook/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'auth_repository.dart';

class AuthRepositoryMockImpl extends AuthRepository {
  @override
  Future<User?> login(String login, String password) async {
    await Future.delayed(const Duration(milliseconds: 1800));
    final resp = await rootBundle.loadString("assets/mock/user.json");
    print("From file:"+resp);
    var map = jsonDecode(resp);
    if(password != "qwerty") return null;
    else return User.fromJson(map);
  }
}
