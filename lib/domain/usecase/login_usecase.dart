import 'package:Placelook/domain/usecase/base_usecase.dart';

class LoginUseCase extends BaseUseCase<String?, ParamLogin> {
  @override
  Future<String?> load(ParamLogin p) => repo.login(p.login, p.password);
}

class ParamLogin {
  String login;
  String password;
  ParamLogin(this.login, this.password);
}
