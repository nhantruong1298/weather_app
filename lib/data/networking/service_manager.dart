import 'package:dio/dio.dart';
import 'package:weather_app/data/entity/response/fetch_forecast_response.dart';
import 'package:weather_app/data/networking/weather_api.dart';
import 'package:weather_app/data/networking/weather_dio.dart';

class ServiceManager {
  late final WeatherApi _weatherApi;

  ServiceManager() {
    final dio = WeatherDio(BaseOptions(
      baseUrl: "https://api.weatherapi.com",
      queryParameters: {
        'key': '186e7721c5604ff3ab025233230111',
      },
    ));

    _weatherApi = WeatherApi.create(dio);
  }

  Future<FetchForecastResponse?> fetchForecast(
      String country, int days, String aqi, String alerts) async {
    final response =
        await _weatherApi.fetchForecast(country, days, aqi, alerts);
    return response;
  }
}
