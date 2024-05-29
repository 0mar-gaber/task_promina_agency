import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constant.dart';

@singleton
class ApiManager {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constant.baseUrl,
        validateStatus: (status) {
          if (status! < 500) {
            return true;
          }
          return false;
        },
      ),
    );
  }

  Future<dynamic> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      Options options = Options(
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );
      Response response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // Handle other status codes
        throw Exception('Failed to load data ${response.statusCode}');
      }
    } catch (error) {
      // Handle DioError and other exceptions
      throw Exception('Network error: $error');
    }
  }

  Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? body,
    FormData? formData, // Add FormData parameter for form data
    String? token, // Optional Bearer token
  }) async {
    try {
      Options options = Options(headers: {'Content-Type': 'application/json'});

      // Check if token is provided, and if so, include it in the authorization header
      if (token != null) {
        options.headers!['Authorization'] = 'Bearer $token';
      }

      // Check if formData is provided, and if so, include it in the request
      if (formData != null) {
        return await dio.post(endPoint, data: formData, options: options);
      } else {
        return await dio.post(endPoint, data: body, options: options);
      }
    } catch (error) {
      // Handle DioError and other exceptions
      throw Exception('Network error: $error');
    }
  }



  Future<Response> putRequest({
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Options options = Options(headers: {'Content-Type': 'application/json'});
      return await dio.put(endPoint, data: body, options: options);
    } catch (error) {
      // Handle DioError and other exceptions
      throw Exception('Network error: $error');
    }
  }

  Future<Response> deleteRequest({
    required String endPoint,
    required String token,
  }) async {
    try {
      Options options = Options(headers: {'Content-Type': 'application/json'});
      return await dio.delete(endPoint, options: options);
    } catch (error) {
      // Handle DioError and other exceptions
      throw Exception('Network error: $error');
    }
  }
}
