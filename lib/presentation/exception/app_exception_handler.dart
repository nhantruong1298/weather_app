import 'package:weather_app/domain/exception/business_exception.dart';
import 'package:weather_app/presentation/exception/app_exception.dart';

class AppExceptionHandler {
  AppException map(dynamic error) {
    if (error is BusinessException) {
      return AppException(error.message);
    }

    return AppException('Unexpected error', originalException: error);
  }
}
