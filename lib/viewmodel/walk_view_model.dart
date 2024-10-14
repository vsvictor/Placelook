import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mongo_dart/mongo_dart.dart' as Mongo;

import '../domain/usecase/get_all_walks_usecase.dart';
import '../model/walk.dart';

class WalkViewModel extends ChangeNotifier {
  late final GetAllWalksUseCase _allWalks =
      GetIt.instance<GetAllWalksUseCase>();
  Walk? _walk;
  late Box<Walk> myWalks;

  WalkViewModel();

  Future<Walk?> getWaltByID(String id) async {
    List<Walk>? list = await _allWalks.load();
    var w = list
        ?.where((food) => food?.id == Mongo.ObjectId.fromHexString(id))
        .first;
    return w;
  }

  Future<Walk?> getWaltByName(String name) async {
    List<Walk>? list = await _allWalks.load();
    var w = list?.where((food) => food?.name == name).first;
    return w;
  }

  int start = 0;

  Walk? get walk => _walk;
  set walk(Walk? val) => (_walk = val);

  void signWalk(Walk selected) async {
    var myWalks = await Hive.openBox<Walk>("walks");
    await myWalks.put(selected.id, selected);
  }
}
