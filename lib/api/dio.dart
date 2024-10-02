import 'package:dio/dio.dart';

class DioInstance {
  Dio _dio = Dio()
    ..options.baseUrl="https://androidspace.dev"
    ..options.connectTimeout = Duration(seconds: 5)
    ..options.contentType="appication/json";
  Dio get dio => _dio;
  static final DioInstance _instance = DioInstance._internal();

  factory DioInstance() {
    return _instance;
  }

  DioInstance._internal(){
  }
}