import 'dart:async';

import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/role.dart';
import 'package:uuid/uuid.dart';
import 'package:Placelook/model/contact.dart';

class User {
  String? _id = null;
  String firstName = "";
  String lastName = "";
  EmailContact email = EmailContact("");
  Role role = Role.Tripper;
  Languages language = Languages.Undefined;
  final _uuid = const Uuid();

  User(this.email,
      {this.firstName = "",
      this.lastName = "",
      this.role = Role.Tripper,
      this.language = Languages.Undefined}) {
    _id = _uuid.v4();
  }
  User.empty() {
    _id = null;
    firstName = "";
    lastName = "";
    email = EmailContact("");
    role = Role.Tripper;
    language = Languages.Undefined;
  }
  User.Anonimus() {
    _id = _uuid.v4();
    firstName = "Anonimus";
    lastName = "";
    email = EmailContact.from("anonimus@gmail.com");
    role = Role.Tripper;
    language = Languages.Undefined;
  }
  User.clone(User aUser) {
    _id = aUser.id;
    firstName = aUser.firstName;
    lastName = aUser.lastName;
    email = EmailContact.from(aUser.email.email);
    role = aUser.role;
    language = aUser.language;
  }

  String get name => firstName + " " + lastName;
  String? get id => _id;
  void generateID() {
    _id = _uuid.v4();
  }

  @override
  String toString() {
    return name + " " + email.email + " " + role.name + " " + language.name;
  }
}
