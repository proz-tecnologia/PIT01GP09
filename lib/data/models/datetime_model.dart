import 'package:finance_app/utils/date_util.dart';

class DateTimeModel {
  final DateTime? date;
  DateTimeModel({
    required this.date,
  });
  String get name =>
      date == null ? 'Todos' : '${date!.getMonthIntoString()}/${date!.year}';
}
