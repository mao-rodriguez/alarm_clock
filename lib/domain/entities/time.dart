class Time {
  int hour;
  int minute;
  String timeFormat;
  Time({required this.hour, required this.minute, required this.timeFormat});
  Time.copy(Time other)
      : hour = other.hour,
        minute = other.minute,
        timeFormat = other.timeFormat;
}
