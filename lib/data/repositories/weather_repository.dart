import 'package:weather_app/data/mapper/weather_data_mapper.dart';
import 'package:weather_app/data/networking/service_manager.dart';
import 'package:weather_app/domain/model/forecast.dart';

class WeatherRepository {
  final ServiceManager _serviceManager;
  final WeatherDataMapper _dataMapper;
  WeatherRepository(this._serviceManager, this._dataMapper);

  Future<FetchForecastResult?> fetchForecast(
      String country, int days, String aqi, String alerts) async {
    final response =
        await _serviceManager.fetchForecast(country, days, aqi, alerts);

    return _dataMapper.mapFetchForecastResponse(response);
  }
}
