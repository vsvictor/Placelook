import 'package:Placelook/model/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
import 'package:Placelook/model/contact.dart';
import 'package:Placelook/model/role.dart';
import 'package:Placelook/model/user.dart';

class UserViewModel extends ValueNotifier<User> {
  UserViewModel(super.value);

  void save() async {
    var pref = await SecureSharedPref.getInstance();
    await pref.putString("id", value.id!);
    await pref.putString("firstaName", value.firstName);
    await pref.putString("lastName", value.lastName);
    await pref.putString("email", value.email.email);
    await pref.putString("role", value.role.name);
    await pref.putString("language", value.language.name);
    print(value.toString());
  }

  static Future<UserViewModel?> fromStorage() async {
    var pref = await SecureSharedPref.getInstance();
    User u = User.empty();
    var id = await pref.getString("id");
    if (id != null) {
      u.generateID();
      u.firstName = await pref.getString("firstaName") ?? "";
      u.lastName = await pref.getString("lastName") ?? "";
      u.email = EmailContact(await pref.getString("email") ?? "");
      pref.getString("role").then((String? s) => {
            if (s != null && !s.isEmpty){
                print(u.toString().trim()),
                u.role = Role.values.byName(s),
              print(u.role.name)
              }
          });
      pref.getString("language").then((String? s)=>{
        if (s != null && !s.isEmpty){
          print(u.toString().trim()),
          u.language = Languages.values.byName(s),
          print(u.language.name)
        }
      });
    }
    return Future<UserViewModel>(() => UserViewModel(u));
  }
}
