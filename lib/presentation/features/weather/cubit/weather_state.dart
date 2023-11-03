part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.init() = WeatherInitial;
  const factory WeatherState.fetching() = LoadingState;

  const factory WeatherState.fetched(FetchForecastResult forecastResult) =
      WeatherLoadedState;

  const factory WeatherState.exception(AppException appException) = WeatherExceptionState;
}
