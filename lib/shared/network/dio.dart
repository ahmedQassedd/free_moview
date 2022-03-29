import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/movie/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, String>? query,
  }) async {
    return await dio!.get(endPoint, queryParameters: query);
  }
}
