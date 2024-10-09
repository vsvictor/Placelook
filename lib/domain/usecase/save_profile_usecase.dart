import 'package:Placelook/domain/usecase/base_usecase.dart';
import 'package:Placelook/model/profile.dart';

class SaveProfileUsecase extends NoResultUseCase<Profile> {
  @override
  void load(Profile param) => repo.saveProfile(param);
}
