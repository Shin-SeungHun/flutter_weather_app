import 'package:flutter_weather_app/data/dto/weather_dto.dart';
import 'package:flutter_weather_app/domain/model/weather_item.dart';

extension DtoToModel on Hourly {
  WeatherItem toWeatherItem() {
    return WeatherItem(
      time: time ?? [],
      temperature: temperature2m ?? [],
      weatherCode: weathercode ?? [],
      relativeHumidity: relativehumidity2m ?? [],
      windSpeed: windspeed10m ?? [],
      pressure: pressureMsl ?? [],
    );
  }
}
