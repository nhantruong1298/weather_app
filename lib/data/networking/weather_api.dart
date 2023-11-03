import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/data/entity/response/fetch_forecast_response.dart';
part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  static WeatherApi create([Dio? client]) => _WeatherApi(client!);

  @GET("/v1/forecast.json?q={country}&days={day}&aqi={aqi}&alerts={alerts}")
  Future<FetchForecastResponse?> fetchForecast(
    @Path() String country,
    @Path() int days,
    @Path() String aqi,
    @Path() String alerts,
  );
}
