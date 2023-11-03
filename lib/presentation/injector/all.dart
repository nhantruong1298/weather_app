import 'package:get_it/get_it.dart';
import 'package:weather_app/data/mapper/weather_data_mapper.dart';
import 'package:weather_app/data/networking/service_manager.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/presentation/exception/app_exception_handler.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  //service
  getIt.registerLazySingleton<ServiceManager>(() => ServiceManager());

  //data mapper
  getIt.registerLazySingleton<WeatherDataMapper>(() => WeatherDataMapper());

  //repository
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepository(
        getIt<ServiceManager>(),
        getIt<WeatherDataMapper>(),
      ));

  //app exception handler
  getIt.registerLazySingleton<AppExceptionHandler>(() => AppExceptionHandler());
}
