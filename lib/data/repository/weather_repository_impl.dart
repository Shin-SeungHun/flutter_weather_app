import 'package:flutter_weather_app/data/dto/weather_dto.dart';
import 'package:flutter_weather_app/domain/model/weather_item.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

import '../data_source/weather_api.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final _api = WeatherApi();

  @override
  Future<WeatherItem> getWeatherItems(
      {required num lat, required num long}) async {
    final WeatherDto dto = await _api.getWeatherInfoJson(lat: lat, long: long);

    WeatherItem weatherItems = WeatherItem(
      time: dto.hourly!.time!,
      temperature: dto.hourly!.temperature2m!,
      weatherCode: dto.hourly!.weathercode!,
      relativeHumidity: dto.hourly!.relativehumidity2m!,
      windSpeed: dto.hourly!.windspeed10m!,
      pressure: dto.hourly!.pressureMsl!,
    );

    return weatherItems;
  }
}
