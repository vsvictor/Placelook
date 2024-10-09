import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/profile.dart';

import '../../model/user.dart';

class AddUserUsecase extends BaseUseCase<User?, User> {
  @override
  Future<User?> load(User param) async => repo.addUser(param);
}
