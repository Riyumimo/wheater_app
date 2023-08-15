import 'dart:async';

import 'package:wheater_app/common_libs.dart';
import 'package:wheater_app/domain/model/forecast/forecast.dart';
import 'package:wheater_app/domain/services/api_service.dart';
import 'package:wheater_app/domain/services/api_client.dart';
import 'package:wheater_app/domain/model/wheater/wheater.dart';
import 'package:wheater_app/presentation/widgets/baground_widget.dart';
part './widgets/header_widgets.dart';
part './widgets/wheater_list_tile.dart';
part './widgets/wheater_widgets.dart';
part './widgets/wheater_time_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiKey = dotenv.env['API_KEY'] ?? 'No Data';
  HomeRepository? _apiClient;
  final ScrollController _scrollController = ScrollController();
  int? selected = 0;
  @override
  void initState() {
    dotenv.load(); // Load environment variables
    // _apiClient = ApiClient();
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
      body: BagroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              Gap(30.h),
              const HeadedWheaterWidget(),
              const WheaterWidget()
              // futureWidgets(),
              ,
              const WheaterListTile(),
              const WheaterListTile(),
              const WheaterListTile(),
              Gap(10.h),
              SizedBox(
                height: 80.h,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    controller: _scrollController,
                    itemBuilder: (itemBuilder, index) {
                      return WheaterTimeItem(
                        selected: selected == index,
                        onChange: (onselected) {
                          // print(index);
                          // print(selec);
                          setState(() {
                            selected = onselected == false ? index : null;
                          });
                        },
                      );
                    }),
              )
              // ChoiceChip(label: label, selected: selected,onSelected: (value)=>,)
            ],
          ),
        ),
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
