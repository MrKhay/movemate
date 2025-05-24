import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String format() => DateFormat('EEEE, MMMM d, yyyy h:mma').format(this);
}
