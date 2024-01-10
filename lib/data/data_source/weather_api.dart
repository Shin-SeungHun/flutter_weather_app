import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/weather_dto.dart';

class WeatherApi {
 Future<WeatherDto> getWeatherInfoJson(double lat, double long) async {
    final response = await http.get(
      Uri.parse(
          'https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,weathercode,relativehumidity_2m,windspeed_10m,pressure_msl&latitude=$lat&longitude=$long'),
    );
    // 36.373868762572464
    // 127.31794258531129
    return WeatherDto.fromJson(jsonDecode(response.body));
  }
}
