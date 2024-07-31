import 'package:placelook/model/user.dart';

class Viewer extends User {
  Viewer(super.name, super.email);
  @override
  Viewer.Anonimus() : super.Anonimus() {}
  @override
  Viewer.clone(Viewer user) : super.clone(user);
}
