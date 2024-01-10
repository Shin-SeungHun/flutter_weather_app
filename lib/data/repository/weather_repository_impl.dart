import 'dart:convert';

import 'package:flutter_weather_app/data/dto/weather_dto.dart';
import 'package:flutter_weather_app/domain/model/weather_item.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';
import 'package:flutter_weather_app/mapper/weather_mapper.dart';
import 'package:http/http.dart' as http;

import '../data_source/weather_api.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final _api = WeatherApi();

  @override
  Future<WeatherItem> getWeatherItems(double lat, double long) async {
    final WeatherDto dto = await _api.getWeatherInfoJson(lat, long);

    WeatherItem weatherItems = WeatherItem(
        time: dto.hourly?.time,
        temperature: dto.hourly?.temperature2m,
        weatherCode: dto.hourly?.weathercode,
        relativeHumidity: dto.hourly?.relativehumidity2m,
        windSpeed: dto.hourly?.windspeed10m,
        pressure: dto.hourly?.pressureMsl);

    return weatherItems;
  }
}
// class WeatherRepositoryImpl implements WeatherRepository {
//   @override
//   Future<List<WeatherItem>> getWeatherItems() async {
//     final response = await http.get(
//       Uri.parse(
//           'https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,weathercode,relativehumidity_2m,windspeed_10m,pressure_msl&latitude=36.373868762572464&longitude=127.31794258531129'),
//     );
//
//     final dto = WeatherDto.fromJson(jsonDecode(response.body));
//
//     // List<WeatherItem> result = WeatherItem(
//     //   time: dto.hourly!.time,
//     //   temperature: dto.hourly!.temperature2m,
//     //   weatherCode: dto.hourly!.weathercode,
//     //   relativeHumidity: dto.hourly!.relativehumidity2m,
//     //   windSpeed: dto.hourly!.windspeed10m,
//     //   pressure: dto.hourly!.pressureMsl,
//     // );
//
//     return result;
//   }
// }
