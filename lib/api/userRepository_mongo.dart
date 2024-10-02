import 'package:Placelook/api/dio.dart';
import 'package:Placelook/api/user_repository.dart';
import 'package:Placelook/model/user.dart';

class UserRepositoryMongo extends UserRepository{
  @override
  void addUser(User user, callback(User u)){
    DioInstance().dio.post("/users", data: user).then((response){
      var code = response.statusCode??-1;
      if(code >= 200 && code < 300){
        var resUser = response.data;
        callback(resUser);
      }
    }, onError: (err){
      throw Exception(err);
    });
  }
}