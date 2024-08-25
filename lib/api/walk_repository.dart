import '../model/walk.dart';

abstract class WalkRepository {
  Future<List<Walk>?> getAllWalks();
}
