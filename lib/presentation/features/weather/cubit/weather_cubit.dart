import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/domain/model/forecast.dart';
import 'package:weather_app/presentation/exception/app_exception.dart';
import 'package:weather_app/presentation/exception/app_exception_handler.dart';
import 'package:weather_app/presentation/injector/all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  late final WeatherRepository _weatherRepository;
  late final AppExceptionHandler _appExceptionHandler;
  WeatherCubit() : super(const WeatherInitial()) {
    _weatherRepository = getIt();
    _appExceptionHandler = getIt();
  }

  Future<void> onScreenInit() async {
    emit(const LoadingState());

    await _fetchForecast('VietNam');
  }

  Future<void> _fetchForecast(String country) async {
    emit(const LoadingState());
    try {
      final forecastResult =
          await _weatherRepository.fetchForecast(country, 1, 'no', 'no');

      final forecastHourFiltered =
          forecastResult?.forecastHour?.where((element) {
        final index = forecastResult.forecastHour?.indexOf(element);
        if (index != null && index % 3 == 0) return true;
        return false;
      }).toList();

      forecastResult?.forecastHour = forecastHourFiltered;

      emit(WeatherLoadedState(forecastResult!));
    } catch (error) {
      final appException = _appExceptionHandler.map(error);

      emit(WeatherExceptionState(appException));
    }
  }

  void onSearchCountryChanged(String value) {
    (value.isEmpty) ? _fetchForecast('VietNam') : _fetchForecast(value);
  }
}
