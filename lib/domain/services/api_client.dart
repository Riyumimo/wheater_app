import 'package:wheater_app/common/failure.dart';
import 'package:wheater_app/domain/model/air_pollutton/air_pollutton.dart';
import 'package:wheater_app/domain/model/forecast/forecast.dart';
import 'package:wheater_app/domain/model/wheater/wheater.dart';
import 'package:wheater_app/domain/services/api_service.dart';
import '../../common_libs.dart';

abstract class ApiClient {
  Future<Either<Failure, WheaterModel?>> fetchCurrentWheater(
      {required String latitude, longitude});
  Future<Either<Failure, ForecastModel>> fetch3HourWheater(
      {required String latitude, longitude});
  Future<Either<Failure, AirPollutton>> fetchAirPollutionwheater(
      {required String latitude, longitude});
}

class HomeRepository implements ApiClient {
  final ApiService apiService;
  HomeRepository(this.apiService);
  @override
  Future<Either<Failure, WheaterModel?>> fetchCurrentWheater(
      {required String latitude, longitude}) async {
    try {
      await dotenv.load();
      String apiKey = dotenv.env['API_KEY'] ?? 'No Data';
      // print(apiKey);
      Map<String, dynamic> data = await apiService.get(
          endPoint: EndPoint.currentWheater,
          queryParameters: {
            'lat': latitude,
            'lon': longitude,
            'appid': apiKey
          });
      WheaterModel wheaterModel = WheaterModel.fromJson(data);
      // print(wheaterModel);
      return Right(wheaterModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioErro(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ForecastModel>> fetch3HourWheater(
      {required String latitude, longitude}) async {
    try {
      await dotenv.load();
      String apiKey = dotenv.env['API_KEY'] ?? 'No Data';
      Map<String, dynamic> data = await apiService.get(
          endPoint: EndPoint.forecastWheater,
          queryParameters: {
            'lat': latitude,
            'lon': longitude,
            'appid': apiKey
          });
      ForecastModel forecastModel = ForecastModel.fromJson(data);
      return Right(forecastModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioErro(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AirPollutton>> fetchAirPollutionwheater(
      {required String latitude, longitude}) async {
    await dotenv.load();
    String apiKey = dotenv.env['API_KEY'] ?? 'No Data';
    try {
      Map<String, dynamic> data = await apiService.get(
          endPoint: EndPoint.airPolution,
          queryParameters: {
            'lat': latitude,
            'lon': longitude,
            'appid': apiKey
          });
      print(data);
      return Right(AirPollutton());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioErro(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
