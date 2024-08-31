import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/user.dart';

class LoadUserUseCase extends NoParamUseCase<User> {
  @override
  Future<User> load() => repo.userFromStogare();
}
