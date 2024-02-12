String formatTime(double minutes) {
  int hours = (minutes / 60).floor();
  int remainingMinutes = (minutes % 60).round();

  if (hours > 0) {
    return '$hours H $remainingMinutes min';
  } else {
    return '$remainingMinutes min';
  }
}
