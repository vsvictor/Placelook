import 'dart:convert';

import 'package:Placelook/model/walk.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class MyWalksViewModel extends ChangeNotifier {
  late Box<Walk> walkBox;
  MyWalksViewModel() {
    Hive.openBox<Walk>("walks").then((box) {
      walkBox = box;
    });
  }
}
