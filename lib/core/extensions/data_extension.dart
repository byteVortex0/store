import 'package:intl/intl.dart';

extension DataExtension on DateTime {
  String get formattedDate {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }
}
