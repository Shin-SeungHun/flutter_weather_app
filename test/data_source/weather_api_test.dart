import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('api test', () async {
    final response = await http.get(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,weathercode,relativehumidity_2m,windspeed_10m,pressure_msl&latitude=36.373868762572464&longitude=127.31794258531129'));

    Map<String, dynamic> json = jsonDecode(response.body);
    expect(json['latitude'], 36.35);
  });
}
