import 'dart:ffi';

import 'package:Placelook/api/repository.dart';
import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../model/user.dart';

class SaveUserUsecase extends NoResultUseCase<User> {
  @override
  void load(User param) => repo.saveUser(param);
}
