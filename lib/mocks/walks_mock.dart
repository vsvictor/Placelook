import 'package:Placelook/model/contact.dart';
import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/location.dart';
import 'package:Placelook/model/user.dart';
import 'package:Placelook/model/walk.dart';

import '../model/role.dart';

var walksMock = [
  Walk(
      location: Location(50.0, 30.0),
      time: DateTime(2024, 8, 22, 16, 30, 0),
      who: User(
          contacts:[EmailContact("dvictor74@gmail.com")],
          firstName: "Віктор",
          lastName: "Джурляе",
          role: Role.Guid,
          language: Languages.Ukranian),
      duration: 90),
  Walk(
      location: Location(52.0, 34.0),
      time: DateTime(2024, 8, 22, 16, 30, 0),
      who: User(
          contacts:[EmailContact("doksana7974@gmail.com")],
          firstName: "Оксана",
          lastName: "Джурляе",
          role: Role.Guid,
          language: Languages.Ukranian),
      duration: 90),
  Walk(
      location: Location(49.0, 28.0),
      time: DateTime(2024, 8, 22, 16, 30, 0),
      who: User(
          contacts: [EmailContact("dd@gmail.com")],
          firstName: "Дмитро",
          lastName: "Джурляе",
          role: Role.Guid,
          language: Languages.English),
      duration: 90),
];
