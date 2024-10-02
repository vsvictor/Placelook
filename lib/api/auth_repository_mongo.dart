import 'package:Placelook/model/profile.dart';
import 'package:dio/dio.dart';

import 'auth_repository.dart';

class AuthRepositoryMongoImpl extends AuthRepository {
  final dio = Dio()
    ..options.baseUrl="https://androidspace.dev"
    ..options.connectTimeout = Duration(seconds: 5)
    ..options.contentType="appication/json";
  @override
  Future<List<Profile?>?> getProfiles() async{
    var res = await dio.get("/users");
    return res.data as List<Profile>;
  }

  @override
  Future<String?> login(String login, String password) async{
    return "";
  }

}