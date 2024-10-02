import 'package:Placelook/api/repository.dart';
import 'package:get_it/get_it.dart';

abstract class BaseUseCase<T, P> {
  var repo = GetIt.instance<Repository>();
  Future<T> load(P param);
}

abstract class NoParamUseCase<T> {
  var repo = GetIt.instance<Repository>();
  Future<T?> load();
}

abstract class NoResultUseCase<P> {
  var repo = GetIt.instance<Repository>();
  void load(P param);
}
