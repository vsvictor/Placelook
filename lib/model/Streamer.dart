import 'package:placelook/model/Contact.dart';
import 'package:placelook/model/user.dart';

import 'Languages.dart';

class Streamer extends User {
  late List<AbstractContact> _contacts;

  Streamer(super.name, super.email);
  @override
  Streamer.empty():super.empty(){
    _contacts = List<AbstractContact>.empty();
  }
  @override
  Streamer.clone(Streamer user):super.clone(user){
    _contacts.addAll(user.contacts);
  }

  List<AbstractContact> get contacts => _contacts;
}