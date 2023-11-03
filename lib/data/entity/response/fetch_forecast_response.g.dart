// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_forecast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchForecastResponse _$FetchForecastResponseFromJson(
        Map<String, dynamic> json) =>
    FetchForecastResponse(
      location: json['location'] == null
          ? null
          : LocationResponse.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : CurrentResponse.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : ForecastResponse.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FetchForecastResponseToJson(
        FetchForecastResponse instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      name: json['name'] as String?,
      country: json['country'] as String?,
      localtime: json['localtime'] as String?,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'localtime': instance.localtime,
    };

CurrentResponse _$CurrentResponseFromJson(Map<String, dynamic> json) =>
    CurrentResponse(
      temp: (json['temp_c'] as num?)?.toDouble(),
      condition: json['condition'] == null
          ? null
          : ConditionResponse.fromJson(
              json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentResponseToJson(CurrentResponse instance) =>
    <String, dynamic>{
      'temp_c': instance.temp,
      'condition': instance.condition,
    };

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) =>
    ForecastResponse(
      forecastDay: (json['forecastday'] as List<dynamic>?)
          ?.map((e) => ForecastDayResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastResponseToJson(ForecastResponse instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastDay,
    };

ForecastDayResponse _$ForecastDayResponseFromJson(Map<String, dynamic> json) =>
    ForecastDayResponse(
      day: json['day'] == null
          ? null
          : DayResponse.fromJson(json['day'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>?)
          ?.map((e) => HourResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayResponseToJson(
        ForecastDayResponse instance) =>
    <String, dynamic>{
      'day': instance.day,
      'hour': instance.hour,
    };

DayResponse _$DayResponseFromJson(Map<String, dynamic> json) => DayResponse(
      maxTemp: (json['maxtemp_c'] as num?)?.toDouble(),
      minTemp: (json['mintemp_c'] as num?)?.toDouble(),
      condition: json['condition'] == null
          ? null
          : ConditionResponse.fromJson(
              json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayResponseToJson(DayResponse instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
      'condition': instance.condition,
    };

ConditionResponse _$ConditionResponseFromJson(Map<String, dynamic> json) =>
    ConditionResponse(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$ConditionResponseToJson(ConditionResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
    };

HourResponse _$HourResponseFromJson(Map<String, dynamic> json) => HourResponse(
      temp: (json['temp_c'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      windKph: (json['wind_kph'] as num?)?.toDouble(),
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$HourResponseToJson(HourResponse instance) =>
    <String, dynamic>{
      'temp_c': instance.temp,
      'humidity': instance.humidity,
      'wind_kph': instance.windKph,
      'time': instance.time?.toIso8601String(),
    };
