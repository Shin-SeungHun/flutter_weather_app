import '../../data/dto/weather_dto.dart';
import '../model/weather_item.dart';

abstract interface class WeatherRepository{
  Future<WeatherItem> getWeatherItems(double lat, double long);
}