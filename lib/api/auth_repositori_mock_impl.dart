import 'dart:convert';
import 'dart:io';

import 'package:Placelook/model/contact.dart';
import 'package:Placelook/model/user.dart';
import 'auth_repository.dart';

class AuthRepositoryMockImpl extends AuthRepository{
  @override
  Future<User> login(String login, String password) async{
    await Future.delayed(const Duration(milliseconds: 1800));
    final resp = await File("../../assets/mock/user.json").readAsString();
    var map = jsonDecode(resp);
    return User(contacts: List<Contact>.empty());
  }
}