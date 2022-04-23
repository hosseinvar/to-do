
import 'package:intl/intl.dart';

String dateFormatter(DateTime date){
  return DateFormat('MMM dd, yyyy').format(date);
}