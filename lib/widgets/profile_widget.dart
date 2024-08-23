import 'package:Placelook/model/contact.dart';
import 'package:flutter/widgets.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/model/user.dart';

class ProfileWidget extends InheritedWidget {
  UserViewModel profile = UserViewModel(User(contacts: List.empty()));
  ProfileWidget({super.key, required super.child});
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static ProfileWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProfileWidget>();
  }
}
