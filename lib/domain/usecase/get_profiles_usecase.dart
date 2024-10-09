import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/profile.dart';

class GetProfilesUseCase extends NoParamUseCase<List<Profile?>> {
  @override
  Future<List<Profile?>?> load() => repo.getProfiles();
}
