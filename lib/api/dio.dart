import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioInstance {
  Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      filter: (options, args) {
        return !args.isResponse || !args.hasUint8ListData;
      },
    ))
    ..options.baseUrl = "https://androidspace.dev"
    ..options.connectTimeout = Duration(seconds: 5)
    ..options.contentType = "application/json";
  Dio get dio => _dio;

  static final DioInstance _instance = DioInstance._internal();

  factory DioInstance() {
    return _instance;
  }

  DioInstance._internal() {}
}
