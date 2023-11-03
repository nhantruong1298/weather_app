import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/features/weather/cubit/weather_cubit.dart';
import 'package:weather_app/presentation/features/weather/views/weather_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WeatherScreen.routeName: (_) => BlocProvider(
        create: (context) => WeatherCubit(),
        child: const WeatherScreen(),
      )
};

const String initialRouteName = WeatherScreen.routeName;
