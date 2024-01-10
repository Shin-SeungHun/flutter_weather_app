import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    print(viewModel.convertTimeList(viewModel.timeList?.length ?? 0));
    // print('timeList : ${viewModel.timeList}');
    // print('templist : ${viewModel.tempList}');
    return Scaffold(
      appBar: AppBar(
        leading: const FlutterLogo(),
        title: const Text('오늘의 날씨'),
        actions: [
          IconButton(
              onPressed: () async {
                await viewModel.fetchWeathers();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: viewModel.isLoading == true
            ? loadingWidget()
            : viewModel.timeList!.isEmpty
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('네트워크 연결확인'),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: 24,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title:
                                  Text(viewModel.convertTimeList(index) ?? ''),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '온도: ${viewModel.tempList?[index] ?? ''}'),
                                  Text(
                                      '풍속: ${viewModel.windSpeedList?[index] ?? ''}'),
                                  Text(
                                      '상대습도: ${viewModel.humidityList?[index] ?? ''}'),
                                  Text(
                                      '기압고도: ${viewModel.pressureList?[index] ?? ''}'),
                                  // Text(
                                  //     '날씨: ${viewModel.weatherCodeList?[index] ?? ''}'),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
      ),
    );
  }
}

Widget loadingWidget() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('날씨 정보를 가져오는 중'),
        SizedBox(
          height: 24,
        ),
        CircularProgressIndicator(),
      ],
    ),
  );
}
