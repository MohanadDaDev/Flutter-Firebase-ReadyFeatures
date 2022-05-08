

import 'package:intl/intl.dart';

int convertDateTimeToInt(DateTime date) {
  return int.parse(DateFormat("yyyyMMdd").format(date));
}

DateTime convertIntToDataTime({
  required int date,
  int houre = 0,
  int minute = 0,
  int seconds = 0,
}) {
  int year = int.parse(date.toString().substring(0, 4));
  int month = int.parse(date.toString().substring(4, 6));
  int day = int.parse(date.toString().substring(6));
  return DateTime(year, month, day, houre, minute, seconds);
}