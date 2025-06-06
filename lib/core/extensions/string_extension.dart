import 'package:intl/intl.dart';

extension StringFormate on String {
  String imageProductFormate() {
    return replaceAll(RegExp(r'^\["?|"\]?|"$'), '');
  }

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String convertDataFormate() {
    final now = DateTime.now();

    return DateFormat('d MMM, y - h:mm a').format(now);
  }
}
