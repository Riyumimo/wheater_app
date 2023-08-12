import 'city.dart';
import 'data_list.dart';

class ForecastModel {
  String? cod;
  int? message;
  int? cnt;
  List<DataList>? list;
  City? city;

  ForecastModel({this.cod, this.message, this.cnt, this.list, this.city});

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        cod: json['cod'] as String?,
        message: json['message'] as int?,
        cnt: json['cnt'] as int?,
        list: (json['list'] as List<dynamic>)
            .map((e) => DataList.fromJson(e as Map<String, dynamic>))
            .toList(),
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'cod': cod,
        'message': message,
        'cnt': cnt,
        'list': list?.map((e) => e.toJson()).toList(),
        'city': city?.toJson(),
      };
}
