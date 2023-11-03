import 'package:dio/dio.dart';
import 'package:dio/src/dio/dio_for_native.dart';
import 'package:dio/src/response.dart';
import 'package:weather_app/domain/exception/business_exception.dart';

class WeatherDio extends DioForNative {
  WeatherDio(BaseOptions options) : super(options);

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) async {
    try {
      final response = await super.fetch<T>(requestOptions);
      return response;
    } catch (error) {
      if (error is DioException) {
        final dioException = error;

        throw BusinessException(dioException.response?.data['error']['message']);
      }
      rethrow;
    }
  }
}
