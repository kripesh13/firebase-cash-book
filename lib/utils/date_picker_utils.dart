import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerUtils {
  // Pick a date
  static Future<DateTime?> pickDate(BuildContext context, DateTime initialDate,
      {DateTime? firstDate, DateTime? lastDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2101),
    );
    return picked;
  }

  // Format the picked date
  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(date);
  }
}
