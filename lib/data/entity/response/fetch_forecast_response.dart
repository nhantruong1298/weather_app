import 'package:json_annotation/json_annotation.dart';

part 'fetch_forecast_response.g.dart';

@JsonSerializable()
class FetchForecastResponse {
  final LocationResponse? location;
  final CurrentResponse? current;
  final ForecastResponse? forecast;
  FetchForecastResponse({
    this.location,
    this.current,
    this.forecast,
  });

  factory FetchForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchForecastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FetchForecastResponseToJson(this);
}

@JsonSerializable()
class LocationResponse {
  final String? name;
  final String? country;
  final String? localtime;
  LocationResponse({
    this.name,
    this.country,
    this.localtime,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}

@JsonSerializable()
class CurrentResponse {
  @JsonKey(name: 'temp_c')
  final double? temp;

  final ConditionResponse? condition;
  CurrentResponse({
    this.temp,
    this.condition,
  });

  factory CurrentResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentResponseToJson(this);
}

@JsonSerializable()
class ForecastResponse {
  @JsonKey(name: 'forecastday')
  final List<ForecastDayResponse>? forecastDay;
  ForecastResponse({this.forecastDay});

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);
}

@JsonSerializable()
class ForecastDayResponse {
  final DayResponse? day;
  final List<HourResponse>? hour;

  ForecastDayResponse({
    this.day,
    this.hour,
  });

  factory ForecastDayResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayResponseToJson(this);
}

@JsonSerializable()
class DayResponse {
  @JsonKey(name: 'maxtemp_c')
  final double? maxTemp;

  @JsonKey(name: 'mintemp_c')
  final double? minTemp;
  final ConditionResponse? condition;

  DayResponse({
    this.maxTemp,
    this.minTemp,
    this.condition,
  });

  factory DayResponse.fromJson(Map<String, dynamic> json) =>
      _$DayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DayResponseToJson(this);
}

@JsonSerializable()
class ConditionResponse {
  final String? text;
  final String? icon;
  ConditionResponse({
    this.text,
    this.icon,
  });

  factory ConditionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConditionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionResponseToJson(this);
}

@JsonSerializable()
class HourResponse {
  @JsonKey(name: 'temp_c')
  final double? temp;

  final double? humidity;

  @JsonKey(name: 'wind_kph')
  final double? windKph;

  final DateTime? time;

  HourResponse({
    this.temp,
    this.humidity,
    this.windKph,
    this.time,
  });

  factory HourResponse.fromJson(Map<String, dynamic> json) =>
      _$HourResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HourResponseToJson(this);
}
