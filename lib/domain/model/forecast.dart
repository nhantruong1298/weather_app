class FetchForecastResult {
  final String? locationName;
  final String? country;

  final double? maxTemp;
  final double? minTemp;

  final String? currentCondition;
  final String? currentIcon;

  List<ForecastHour>? forecastHour;
  final String? localTime;

  FetchForecastResult({
    this.locationName,
    this.country,
    this.maxTemp,
    this.minTemp,
    this.currentCondition,
    this.forecastHour,
    this.currentIcon,
    this.localTime,
  });
}

class ForecastHour {
  final double? temp;
  final double? humidity;
  final double? windKph;
  final DateTime? time;

  ForecastHour({
    this.temp,
    this.humidity,
    this.windKph,
    this.time,
  });
}
