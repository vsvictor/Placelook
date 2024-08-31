import 'dart:convert';
import 'package:Placelook/api/walk_repository.dart';
import 'package:Placelook/model/walk.dart';
import 'package:Placelook/utils/convertor.dart';
import 'package:flutter/services.dart';

class WalkRepositoryMockImpl extends WalkRepository {
  @override
  Future<List<Walk>?> getAllWalks() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final resp = await rootBundle.loadString("assets/mock/walks.json");
    List<Walk> data = [];
    var list = jsonDecode(resp);
    list.forEach((e) => {data.add(Walk.fromJson(convertMap(e)))});
    return data;
  }
}
