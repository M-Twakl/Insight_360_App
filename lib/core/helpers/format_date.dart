import 'package:intl/intl.dart';

String formatMyDate(String rawDate) {
  try {
    DateTime parsedDate = DateTime.parse(rawDate);

    return DateFormat('MMMM d, yyyy').format(parsedDate);

  } catch (e) {
    return "Unknown Date";
  }
}