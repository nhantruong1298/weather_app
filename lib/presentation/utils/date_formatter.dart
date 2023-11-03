import 'package:intl/intl.dart';
import 'package:weather_app/presentation/resources/app_constants.dart';

class DateFormatter {
  static DateTime toLocalDate(DateTime date, bool toLocal) {
    return toLocal ? date.toLocal() : date;
  }

  static String formatCardExpiryDate(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';
    final dateTime = toLocalDate(date, toLocal);
    final formatter = DateFormat('MM/yy');
    return formatter.format(dateTime);
  }

  static String formatDate(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';
    final DateFormat formatter = DateFormat(AppConstants.dateFormat);
    return formatter.format(toLocalDate(date, toLocal));
  }

  static String toFullDateTimeFormat(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';

    final DateFormat formatter = DateFormat(AppConstants.fullDateTimeFormat);
    return '${formatter.format(toLocalDate(date, toLocal))} (GMT +${date.toLocal().timeZoneOffset.inHours})';
  }

  static String toShortDate(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';

    final DateFormat formatter = DateFormat(AppConstants.shortDateFormat);
    return formatter.format(toLocalDate(date, toLocal));
  }

  static String getMonthShortName(DateTime date, {bool toLocal = true}) {
    final DateFormat formatter = DateFormat('MMM');
    return formatter.format(toLocalDate(date, toLocal));
  }

  static String getMonthShortNameFromCode(int month) {
    DateTime monthDate = DateTime(DateTime.now().year, month = month);
    return getMonthShortName(monthDate);
  }

  static String toDateTime(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';
    final DateFormat formatter = DateFormat(AppConstants.dateTimeFormat);
    return formatter.format(toLocalDate(date, toLocal));
  }

  static String toDayTime(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';
    final DateFormat formatter = DateFormat(AppConstants.dayTimeFormat);
    return formatter.format(toLocalDate(date, toLocal));
  }

  static String toTime(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';
    final DateFormat formatter = DateFormat(AppConstants.timeFormat);
    return formatter.format(toLocalDate(date, toLocal));
  }
}
