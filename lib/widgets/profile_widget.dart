import 'package:flutter/widgets.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/model/user.dart';

class ProfileWidget extends InheritedWidget {
  UserViewModel profile = UserViewModel(User.empty());
  ProfileWidget({super.key, required super.child});
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
