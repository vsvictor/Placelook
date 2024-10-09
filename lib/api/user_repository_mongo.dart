import 'dart:convert';
import 'package:Placelook/api/dio.dart';
import 'package:Placelook/api/user_repository.dart';
import 'package:Placelook/model/user.dart';

class UserRepositoryMongo extends UserRepository {
  @override
  Future<User?> addUser(User user) async {
    var result =
        await DioInstance().dio.post("/users", data: jsonEncode(user.toJson()));
    var decoded = jsonDecode(result.data);
    return User.fromJson(decoded);
  }
}
