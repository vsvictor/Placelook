
import 'package:Placelook/api/repository.dart';
import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/user.dart';
import 'package:Placelook/viewmodel/user_model;.dart';

class LoginUseCase extends BaseUseCase<User, ParamLogin>{
  @override
  Future<User> load(ParamLogin p) => repo.login(p.login, p.password);
}
class ParamLogin{
  String login = "";
  String password = "";
  ParamLogin(this.login, this.password);
}
