import 'dart:ffi';
import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/user.dart';

class GetUserUseCase extends NoParamUseCase<User?> {
  @override
  Future<User?> load() => repo.getUser();
}
