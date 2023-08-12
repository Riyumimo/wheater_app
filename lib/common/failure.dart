import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  factory ServerFailure.fromDioErro(DioException dioException) {
    switch (dioException.type) {
      case DioException.connectionTimeout:
        return ServerFailure('Connection timeout with Api Server');
      case DioException.sendTimeout:
        return ServerFailure('Send timeout with Api Server');
      case DioException.receiveTimeout:
        return ServerFailure('Receive timeout with Api Server');
      case DioException.badResponse:
        return ServerFailure.fromDioResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioException.requestCancelled:
        return ServerFailure('Request to ApiServer was canceled');
      default:
        return ServerFailure('Opps there was an error, Please try again!');
    }
  }

  factory ServerFailure.fromDioResponse(int statsCode, dynamic response) {
    switch (statsCode) {
      case 401:
      case 402:
      case 403:
        return ServerFailure(response['error']['message']);
      case 404:
        return ServerFailure('Your request not found, Please try later!');
      case 500:
        return ServerFailure('Internal server error, Please try later!');
      default:
        return ServerFailure(response['error']['message']);
    }
  }
}
