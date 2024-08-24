
import 'package:flutter/widgets.dart';
import 'package:Placelook/model/user.dart';

import '../viewmodel/user_model;.dart';

class ProfileWidget extends InheritedWidget {
  UserModel profile =
      UserModel(User(contacts: List.empty(growable: true)));
  ProfileWidget({super.key, required super.child});
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static ProfileWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProfileWidget>();
  }
}
