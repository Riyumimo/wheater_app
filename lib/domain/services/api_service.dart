import 'package:dio/dio.dart';
import 'package:wheater_app/common/constant.dart';

abstract class ApiService {
  Future<Map<String, dynamic>> get({
    required String endPoint,
    required Map<String, dynamic> queryParameters,
  });
}

class ApiServiceImplementation implements ApiService {
  Dio? _dio;

  ApiServiceImplementation() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: EndPoint.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10));
    print(baseOptions);
    _dio = Dio(baseOptions);
  }
  @override
  Future<Map<String, dynamic>> get(
      {required String endPoint,
      required Map<String, dynamic> queryParameters}) async {
    try {
      Response response =
          await _dio!.get(endPoint, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
