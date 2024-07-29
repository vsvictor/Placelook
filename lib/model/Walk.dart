import 'package:placelook/model/Streamer.dart';
import 'Languages.dart';
import 'Location.dart';
import 'TypeWalk.dart';

class Walk{
  final Location _location;
  final DateTime _time;
  final Streamer _who;
  final int _duration;
  final Languages _language;
  final TypeWalk _typeWalk;

  Walk(this._location, this._time, this._who, this._duration, this._language, this._typeWalk);
  Location get location => _location;
  DateTime get time => _time;
  Streamer get streamer => _who;
  int get duration => _duration;
  Languages get language => _language;
  TypeWalk get typeWalk => _typeWalk;
}