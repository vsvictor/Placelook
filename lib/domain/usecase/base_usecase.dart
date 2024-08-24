import 'package:Placelook/api/repository.dart';
import 'package:get_it/get_it.dart';

abstract class BaseUseCase<T, P>{
  var repo = GetIt.instance<Repository>();
  Future<T> load(P param);
}