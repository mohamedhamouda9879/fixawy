// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://technician.amrhs.tech/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String Url,
    Map<String, dynamic>? query,
    String? auth,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': auth,
    };
    return await dio.get(
      Url,
      queryParameters: query,
    );
  }

  static Future<Response> updateData({
    required String Url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? auth,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': auth,
    };
    return await dio.patch(Url, queryParameters: query, data: data);
  }

  static Future<Response> postData({
    required String Url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? auth,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': auth,
      'Accept': 'application/json'
    };
    return dio.post(Url, queryParameters: query, data: data);
  }
}
