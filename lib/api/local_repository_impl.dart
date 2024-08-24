import 'package:Placelook/model/user.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
import '../utils/convertor.dart';
import 'local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  @override
  Future<User> userFromStogare() async {
    var pref = await SecureSharedPref.getInstance();
    User u = User(contacts: List.empty());
    var f = await pref.getMap("profile");
    if (f != null) {
      u = User.fromJson(convertMap(f));
    }
    return Future<User>(() => u);
  }

  @override
  void saveUser(User u) async {
    var pref = await SecureSharedPref.getInstance();
    await pref.putMap("profile", u.toJson());
    print(u.toJson().toString());
  }
}
