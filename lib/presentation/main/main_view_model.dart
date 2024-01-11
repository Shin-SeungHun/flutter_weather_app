import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/repository/weather_repository_impl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../domain/model/weather_item.dart';

class MainViewModel extends ChangeNotifier {
  final _repository = WeatherRepositoryImpl();
  List<String> _timeList = [];
  List<num> _tempList = [];
  List<num> _humidityList = [];
  List<num> _weatherCodeList = [];
  List<num> _windSpeedList = [];
  List<num> _pressureList = [];


  bool isLoading = false;

  Future<void> fetchWeathers() async {
    isLoading = true;
    notifyListeners();

    WeatherItem weatherItem = await _repository.getWeatherItems(
      lat: 36.373868762572464,
      long: 127.31794258531129,
    );
    _timeList = weatherItem.time;
    _tempList = weatherItem.temperature;
    _humidityList = weatherItem.relativeHumidity;
    _weatherCodeList = weatherItem.weatherCode;
    _windSpeedList = weatherItem.windSpeed;
    _pressureList = weatherItem.pressure;

    isLoading = false;
    notifyListeners();
  }

  String convertTimeList({required int i}) {
    initializeDateFormatting('ko_KR', null);

    if (i < timeList.length) {
      DateTime date = DateTime.parse(timeList[i]);
      DateFormat formatter = DateFormat('yyyy년 M월 d일 EEEE H시', 'ko_KR');

      return formatter.format(date);
    }

    return 'N/A';
  }

  String convertTime({required int i}) {
    initializeDateFormatting('ko_KR', null);

    if (i < timeList.length) {
      DateTime date = DateTime.parse(timeList[i]);
      String formatter = DateFormat('a h시', 'ko_KR').format(date);

      return formatter;
    }

    return 'N/A';
  }

  List<String> get timeList => _timeList;

  List<num> get tempList => _tempList;

  List<num> get humidityList => _humidityList;

  List<num> get weatherCodeList => _weatherCodeList;

  List<num> get windSpeedList => _windSpeedList;

  List<num> get pressureList => _pressureList;
}
