import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/user.dart';

class GetUserUseCase extends NoParamUseCase<List<User?>> {
  @override
  Future<List<User?>> load() => repo.getUsers();
}
