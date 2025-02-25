import 'package:intl/intl.dart';

class DateFormatter {

  static DateTime? parseDate(String date) {
    try {
      return DateFormat('dd-MM-yyyy').parse(date);
    } catch (e) {
      return null;
    }
  }

  static String getFormattedDate(DateTime? date,{String format='dd-MM-yyyy'}){
    return DateFormat(format).format(date!);
  }
}
