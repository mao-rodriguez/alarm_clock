class Time {
  int hour;
  int minute;
  String timeFormat;
  Time({required this.hour, required this.minute, required this.timeFormat});
  Time.copy(Time other)
      : hour = other.hour,
        minute = other.minute,
        timeFormat = other.timeFormat;

  /// Converts from 12-hour format to 24-hour format.
  int get format24Hour {
    int hour24format = hour;

    if (timeFormat == 'PM' && hour != 12) {
      hour24format = hour + 12;
      return hour24format;
    }
    if (timeFormat == 'AM' && hour == 12) {
      hour24format = 0;
      return hour24format;
    }
    return hour24format;
  }
}
