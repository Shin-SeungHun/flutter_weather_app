class WeatherItem {
  List<String>? time;
  List<num>? temperature;
  List<num>? weatherCode;
  List<num>? relativeHumidity;
  List<num>? windSpeed;
  List<num>? pressure;

//<editor-fold desc="Data Methods">
  WeatherItem({
    this.time,
    this.temperature,
    this.weatherCode,
    this.relativeHumidity,
    this.windSpeed,
    this.pressure,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherItem &&
          runtimeType == other.runtimeType &&
          time == other.time &&
          temperature == other.temperature &&
          weatherCode == other.weatherCode &&
          relativeHumidity == other.relativeHumidity &&
          windSpeed == other.windSpeed &&
          pressure == other.pressure);

  @override
  int get hashCode =>
      time.hashCode ^
      temperature.hashCode ^
      weatherCode.hashCode ^
      relativeHumidity.hashCode ^
      windSpeed.hashCode ^
      pressure.hashCode;

  @override
  String toString() {
    return 'WeatherItem{' +
        ' time: $time,' +
        ' temperature: $temperature,' +
        ' weatherCode: $weatherCode,' +
        ' relativeHumidity: $relativeHumidity,' +
        ' windSpeed: $windSpeed,' +
        ' pressure: $pressure,' +
        '}';
  }

  WeatherItem copyWith({
    List<String>? time,
    List<num>? temperature,
    List<num>? weatherCode,
    List<num>? relativeHumidity,
    List<num>? windSpeed,
    List<num>? pressure,
  }) {
    return WeatherItem(
      time: time ?? this.time,
      temperature: temperature ?? this.temperature,
      weatherCode: weatherCode ?? this.weatherCode,
      relativeHumidity: relativeHumidity ?? this.relativeHumidity,
      windSpeed: windSpeed ?? this.windSpeed,
      pressure: pressure ?? this.pressure,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': this.time,
      'temperature': this.temperature,
      'weatherCode': this.weatherCode,
      'relativeHumidity': this.relativeHumidity,
      'windSpeed': this.windSpeed,
      'pressure': this.pressure,
    };
  }

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    return WeatherItem(
      time: json['time'] as List<String>,
      temperature: json['temperature'] as List<num>,
      weatherCode: json['weatherCode'] as List<num>,
      relativeHumidity: json['relativeHumidity'] as List<num>,
      windSpeed: json['windSpeed'] as List<num>,
      pressure: json['pressure'] as List<num>,
    );
  }

//</editor-fold>
}
