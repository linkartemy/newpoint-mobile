import 'package:intl/intl.dart';

DateTime? parseDateFromString(String? rawDate) {
  if (rawDate == null || rawDate.isEmpty) return null;
  return DateTime.tryParse(rawDate);
}

String? convertPostDateToString(DateTime? date) {
  if (date == null) return null;
  return "${DateFormat.yMMMMd().format(date.toLocal())} ${DateFormat.jm().format(date.toLocal())}";
}

String? convertCommentDateToString(DateTime? date) {
  if (date == null) return null;
  return "${DateFormat.yMd().format(date.toLocal())} ${DateFormat.jm().format(date.toLocal())}";
}
