import 'package:Placelook/domain/usecase/base_usecase.dart';

import '../../model/user.dart';

class SaveUserUsecase extends NoResultUseCase<User> {
  @override
  void load(User param) => repo.saveUser(param);
}
