import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

isNumeric(string) => num.tryParse(string) != null;

String showLastMessageTime(DateTime dateTime) {
  DateTime now =DateTime.now();

  if (now.difference(dateTime).inDays > 1 || now.day != dateTime.day){
    if(dateTime.year != now.year)
      return DateFormat("MMM dd, yy").format(dateTime);
    return DateFormat("MMM dd").format(dateTime);
  }
  return DateFormat("hh:mm aa").format(dateTime);
}
