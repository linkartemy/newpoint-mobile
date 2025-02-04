import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

DateTime? parseDateFromString(String? rawDate) {
  if (rawDate == null || rawDate.isEmpty) return null;
  return DateTime.tryParse(rawDate);
}

String dateToAgoString(BuildContext context, DateTime date,
    {bool isShort = false}) {
  var locale = AppLocalizations.of(context)!.localeName;
  if (isShort) {
    locale += '_short';
  }
  return timeago.format(date, locale: locale);
}

String? convertCommentDateToString(DateTime? date) {
  if (date == null) return null;
  return "${DateFormat.yMd().format(date.toLocal())} ${DateFormat.jm().format(date.toLocal())}";
}
