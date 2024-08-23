import 'dart:async';
import 'dart:ffi';

import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:Placelook/model/contact.dart';
import 'package:uuid/uuid.dart';

/*class User {
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
  void set id(String? value) => _id = value;
  void generateID() {
    _id = _uuid.v4();
  }

  @override
  String toString() {
    return name + " " + email.email + " " + role.name + " " + language.name;
  }
}*/
part 'user.freezed.dart';
//part 'user.g.dart';

@unfreezed
class User with _$User{
  User._();
  factory User({
      @Default(null)String? id,
      @Default("")String firstName,
      @Default("")String lastName,
      required List<Contact> contacts,
      @Default(Role.Tripper) Role role,
      @Default(Languages.Undefined)Languages language}) = _User;
  //factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String? get email  {
    var res = "";
    var e = contacts.where((el)=> el is EmailContact);
    if(e.length>0){
      var ee = (e.first as EmailContact).email;
      if(ee != null) res = ee;
    }
    return res;
  }


  void generateID(){
    id = Uuid().v4();
  }
}