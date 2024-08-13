import 'package:placelook/model/Contact.dart';
import 'package:uuid/uuid.dart';

class User {
  late String _id;
  late String _name;
  late EmailContact _email;
  final _uuid = const Uuid();

  User(this._name, this._email) {
    _id = _uuid.v4();
  }
  User.empty() {
    _id = "";
    _name = "";
    _email = EmailContact("");
  }
  User.Anonimus() {
    _id = _uuid.v4();
    _name = "Anonimus";
    _email = EmailContact.from("anonimus@gmail.com");
  }
  User.clone(User aUser) {
    _id = aUser.id;
    _name = aUser.name;
    _email = EmailContact.from(aUser.email);
  }
  String get id => _id;

  String get name => _name;
  set name(String value) => _name = value;

  String get email => _email.email;
  set email(String value) => _email = EmailContact.from(value);
}
