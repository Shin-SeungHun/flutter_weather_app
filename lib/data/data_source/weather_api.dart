import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  Future<Map<String, dynamic>> getWeatherInfoJson() async {
    final response = await http.get(
      Uri.parse(
          'https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,weathercode,relativehumidity_2m,windspeed_10m,pressure_msl&latitude=36.373868762572464&longitude=127.31794258531129'),
    );
    return jsonDecode(response.body);
  }
}
