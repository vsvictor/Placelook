import 'package:Placelook/domain/usecase/get_all_walks_usecase.dart';
import 'package:Placelook/model/walk.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class WalksViewModel extends ChangeNotifier {
  List<Walk>? list = List.empty();
  late GetAllWalksUseCase _allWalks = GetIt.instance<GetAllWalksUseCase>();

  WalksViewModel();

   Future? getAllWalks() async {
    list = await _allWalks.load() as List<Walk>?;
    return null;
  }
}
