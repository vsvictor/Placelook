import 'package:Placelook/domain/usecase/get_all_walks_usecase.dart';
import 'package:Placelook/model/walk.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class MapViewModel extends ChangeNotifier {
  List<Walk>? _list = List.empty();
  late GetAllWalksUseCase _allWalks = GetIt.instance<GetAllWalksUseCase>();
  set list(List<Walk>? value) {
    _list = value;
    notifyListeners();
  }

  List<Walk>? get list => _list;
  MapViewModel() {
  }

  Future getAllWalks() async {
    _allWalks.load().then((List<Walk>? l) => {list = l});
  }
}
