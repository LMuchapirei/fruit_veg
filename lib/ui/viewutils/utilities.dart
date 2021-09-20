


String dateFormatter(DateTime dateTime){
  String timeOfDay=dateTime.hour<12?'AM':'PM';
  return "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute} "+timeOfDay;
}