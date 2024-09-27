import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../domain/usecase/get_all_walks_usecase.dart';
import '../model/walk.dart';

class WalkViewModel extends ChangeNotifier {
  late final GetAllWalksUseCase _allWalks =
      GetIt.instance<GetAllWalksUseCase>();
  Walk? _walk;
  Future<Walk?> getWaltByID(String id) async {
    List<Walk>? list = await _allWalks.load();
    var w = list?.where((food) => food?.id == id).first;
    return w;
  }

  int start = 0;

  Walk? get walk => _walk;
  set walk(Walk? val) => (_walk = val);
}
