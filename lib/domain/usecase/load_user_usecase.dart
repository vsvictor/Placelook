
import 'dart:ffi';
import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/user.dart';

class LoadUserUseCase extends BaseUseCase<User, Null>{
  @override
  Future<User> load(Null) => repo.userFromStogare();
}
