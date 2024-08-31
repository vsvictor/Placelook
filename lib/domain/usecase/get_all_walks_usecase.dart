import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/walk.dart';

class GetAllWalksUseCase extends NoParamUseCase<List<Walk>?> {
  @override
  Future<List<Walk>?> load() => repo.getAllWalks();
}
