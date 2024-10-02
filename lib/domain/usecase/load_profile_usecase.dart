import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/profile.dart';

class LoadProfileUseCase extends NoParamUseCase<Profile> {
  @override
  Future<Profile> load() => repo.userFromStogare();
}
