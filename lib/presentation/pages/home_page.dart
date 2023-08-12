import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wheater_app/domain/services/api_service.dart';
import 'package:wheater_app/domain/services/api_client.dart';
import 'package:wheater_app/domain/model/wheater/wheater.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiKey = dotenv.env['API_KEY'] ?? 'No Data';
  HomeRepository? _apiClient;

  @override
  void initState() {
    dotenv.load(); // Load environment variables
    // _apiClient = ApiClient();
    final apiservice = ApiServiceImplementation();
    print(apiservice);

    _apiClient = HomeRepository(apiservice);
    super.initState();
  }

  Future<Either<String, WheaterModel>>? getData(
      HomeRepository homeRepository) async {
    final data = await homeRepository.fetchCurrentWheater(
        latitude: '-1.653443547923544', longitude: '103.63986009999999');
    print(data);
    return data.fold((left) {
      return Left(left.error);
    }, (right) {
      return Right(right!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: getData(_apiClient!),
            builder: (context, snaphot) {
              if (snaphot.data == null) {
                return Text('data null');
              }
              print(" data = ${snaphot.data}");
              print(snaphot.connectionState);
              if (snaphot.connectionState == ConnectionState.done) {
                return snaphot.data!.fold(
                    (left) => Text(left), (right) => Text(right.name ?? ''));
              } else if (snaphot.connectionState == ConnectionState.waiting) {
                return const Text('wait');
              } else {
                return Text('error');
              }
            }),
      ),
    );
  }
}
