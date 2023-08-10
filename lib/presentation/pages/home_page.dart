import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wheater_app/domain/services/api_client.dart';
import 'package:wheater_app/domain/wheater/wheater.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiKey = dotenv.env['API_KEY'] ?? 'No Data';
  final ApiClient _apiClient = ApiClient();

  @override
  void initState() {
    dotenv.load(); // Load environment variables
    // _apiClient = ApiClient();
    super.initState();
  }

  Future<Whater> getData(ApiClient apiClient) async {
    final data =
        await apiClient.getData(-1.653443547923544, 103.63986009999999);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // print(apiKey);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: getData(_apiClient),
            builder: (context, snaphot) {
              print(snaphot.connectionState);
              if (snaphot.connectionState == ConnectionState.done) {
                return Text(snaphot.data!.name ?? '');
              } else if (snaphot.connectionState == ConnectionState.waiting) {
                return const Text('wait');
              } else {
                return const Text('error');
              }
            }),
      ),
    );
  }
}
