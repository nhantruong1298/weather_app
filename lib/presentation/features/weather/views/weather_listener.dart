part of 'weather_screen.dart';

void listener(BuildContext context, WeatherState state) {
  state.maybeWhen(
    exception: (appException) {
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(message: appException.displayMessage);
          });
    },
    orElse: () {},
  );
}
