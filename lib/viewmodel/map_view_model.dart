import 'package:Placelook/domain/usecase/get_all_walks_usecase.dart';
import 'package:Placelook/model/walk.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class MapViewModel extends ChangeNotifier {
  FeatureLayer? walkLayer = null;
  List<Walk>? _list = List.empty();
  late final GetAllWalksUseCase _allWalks =
      GetIt.instance<GetAllWalksUseCase>();
  set list(List<Walk>? value) {
    _list = value;
    notifyListeners();
  }

  List<Walk>? get list => _list;
  MapViewModel();

  Future getAllWalks() => _allWalks.load().then((List<Walk>? l) => {list = l});
}
