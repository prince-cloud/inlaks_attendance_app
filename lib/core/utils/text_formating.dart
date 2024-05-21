

import 'package:intl/intl.dart';

extension StringExtension on String {
  String get capitalize {
    if (trim().isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}
    String get titleCase {
    if (trim().isEmpty) return this;
    return split(' ').map<String>((e) => e.capitalize).toList().join(' ');}
}


String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('EEEE, dd MMMM, yyyy').format(dateTime);
}