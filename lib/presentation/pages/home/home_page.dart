import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:gap/gap.dart';
import 'package:wheater_app/common_libs.dart';
import 'package:wheater_app/domain/model/forecast/forecast.dart';
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

    _apiClient = HomeRepository(apiservice);
    super.initState();
  }

  Future<Either<String, WheaterModel>>? getCurrentWheater(
      HomeRepository homeRepository) async {
    final data = await homeRepository.fetchCurrentWheater(
        latitude: '-1.653443547923544', longitude: '103.63986009999999');
    // print(data);
    return data.fold((left) {
      return Left(left.error);
    }, (right) {
      return Right(right!);
    });
  }

  Future<Either<String, ForecastModel>> get3HourForecast(
      HomeRepository homeRepository) async {
    final data = await homeRepository.fetch3HourWheater(
        latitude: '-1.653443547923544', longitude: '103.63986009999999');
    // print(data);
    return data.fold((left) => Left(left.error), (right) => Right(right));
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width;
    // final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Column(
              children: [
                Text(
                  'Stockholm,Sweden',
                  style: $style.text.title1,
                  maxLines: 2,
                ),
                const Gap(6),
                Text(
                  'Tue, Jun 30',
                  style: $style.text.bodyBold,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              const SizedBox(height: 80, width: 83, child: Placeholder()),
              const Gap(10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '19',
                      style: $style.text.header1,
                    ),
                    Text(
                      'Rainy',
                      style: $style.text.title2,
                    )
                  ],
                ),
              )
            ],
          )
          // futureWidgets(),
          ,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 8, horizontal: 11),
              height: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0x5CFFFFFF)),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 22,
                    width: 22,
                    child: Placeholder(),
                  ),
                  Text(
                    'rainfall',
                    style: $style.text.bodySmallBold,
                  ),
                  const Spacer(),
                  Text(
                    '3cm',
                    style: $style.text.bodySmallBold,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column futureWidgets() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        FutureBuilder(
            future: getCurrentWheater(_apiClient!),
            builder: (context, snaphot) {
              if (snaphot.data == null) {
                return const Text('data null');
              }
              // print(" data = ${snaphot.data}");
              if (snaphot.connectionState == ConnectionState.done) {
                return snaphot.data!.fold(
                    (left) => Text(left), (right) => Text(right.name ?? ''));
              } else if (snaphot.connectionState == ConnectionState.waiting) {
                return const Text('wait');
              } else {
                return const Text('error');
              }
            }),
        FutureBuilder(
            future: get3HourForecast(_apiClient!),
            builder: (context, snaphot) {
              if (snaphot.data == null) {
                return const Text('data null');
              }
              if (snaphot.connectionState == ConnectionState.done) {
                return snaphot.data!.fold((left) => Text(left),
                    (right) => Text(right.city!.name ?? ''));
              } else if (snaphot.connectionState == ConnectionState.waiting) {
                return const Text('wait');
              } else {
                return const Text('error');
              }
            }),
        const Spacer()
      ],
    );
  }
}
