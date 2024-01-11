import 'package:flutter/material.dart';
import 'package:flutter_weather_app/di/di_setup.dart';
import 'package:flutter_weather_app/presentation/main/main_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'presentation/main/main_view_model.dart';

void main()  {
  diSetup();
  // WidgetsFlutterBinding.ensureInitialized();
  // await initializeDateFormatting('ko_KR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider.value(
        value: GetIt.instance<MainViewModel>(),
        child: const MainScreen(),
      ),
    );
  }
}
