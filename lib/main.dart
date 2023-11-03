import 'package:flutter/material.dart';
import 'package:weather_app/presentation/app/routes.dart';
import 'package:weather_app/presentation/injector/all.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  configureDependencies();
  await initializeDateFormatting("en_US", null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: initialRouteName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 88, 172, 241)),
        useMaterial3: true,
      ),
    );
  }
}
