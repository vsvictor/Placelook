
import 'package:flutter/widgets.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';

class ProfileWidget extends InheritedWidget {
  UserViewModel profile;
  ProfileWidget({super.key, required this.profile, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    var res = false;
    oldWidget as ProfileWidget;
    res = (oldWidget.profile.value.id!.isEmpty &&
            this.profile.value.id!.isNotEmpty) ||
        (oldWidget.profile.value.id != this.profile.value.id);
    return res;
  }

  static ProfileWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProfileWidget>();
  }
}
