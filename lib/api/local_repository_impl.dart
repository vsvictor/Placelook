
import 'package:Placelook/model/user.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
import '../utils/convertor.dart';
import '../viewmodel/user_model;.dart';
import 'local_repository.dart';

class LocalRepositoryImpl extends LocalRepository{
  @override
  Future<User> userFromStogare() async{
    var pref = await SecureSharedPref.getInstance();
    User u = User(contacts: List.empty());
    var f = await pref.getMap("profile");
    if (f != null) {
      u = User.fromJson(convertMap(f));
    }
    return Future<User>(() => u);
  }

}