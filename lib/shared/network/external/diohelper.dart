import 'package:dio/dio.dart';

class DioHelper {
  static late Dio myDioInstance;
  static Dio_Init() {
    myDioInstance = Dio(
      BaseOptions(baseUrl: 'https://newsapi.org/'),
    );
  }

  static Future<Response> GetData(
      {required String url, required Map<String, Object> urlParams}) async {
    return await myDioInstance.get(url, queryParameters: urlParams);
  }
}
