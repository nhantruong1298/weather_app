import 'package:weather_app/data/entity/response/fetch_forecast_response.dart';
import 'package:weather_app/domain/model/forecast.dart';

class WeatherDataMapper {
  FetchForecastResult? mapFetchForecastResponse(
      FetchForecastResponse? response) {
    if (response == null) return null;

    final forecastHour = <ForecastHour>[];

    response.forecast?.forecastDay?[0].hour?.forEach((hour) {
      forecastHour.add(ForecastHour(
        temp: hour.temp,
        humidity: hour.humidity,
        windKph: hour.windKph,
        time: hour.time,
      ));
    });

    return FetchForecastResult(
      currentCondition: response.current?.condition?.text,
      currentIcon: response.current?.condition?.icon,
      locationName: response.location?.name,
      country: response.location?.country,
      maxTemp: response.forecast?.forecastDay?[0].day?.maxTemp,
      minTemp: response.forecast?.forecastDay?[0].day?.minTemp,
      forecastHour: forecastHour,
      localTime: response.location?.localtime,
    );
  }
}
