import 'dart:convert';

import 'package:wheater_app/common/constant.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:wheater_app/domain/wheater/wheater.dart';

class ApiClient<T> {
  final baseUrl = Constants.BASE_URL;
  Future<Whater> getData(double latitude, double logintude) async {
    await dotenv.load();
    try {
      String apiKey = dotenv.env['API_KEY'] ?? 'No Data';
      final url =
          Uri.parse('${baseUrl}lat=$latitude&lon=$logintude&appid=$apiKey');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final whater = Whater.fromJson(data);
        return whater;
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      rethrow;
    }
  }
}
