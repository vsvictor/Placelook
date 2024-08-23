import 'package:Placelook/mocks/walks_mock.dart';
import 'package:Placelook/model/walk.dart';
import 'package:flutter/foundation.dart';

class WalksViewModel extends ChangeNotifier {
  Walks list = List.empty();
  void load() async{
    list.addAll(walksMock);
    notifyListeners();
  }
}
