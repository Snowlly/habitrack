class Habit {
  String name;
  bool doneToday;
  int streak;
  DateTime? lastDone;

  Habit({required this.name})
      : doneToday = false,
        streak = 0,
        lastDone = null;


  void newDayCheck() {
    final t = DateTime.now();
    if (lastDone == null) {
      doneToday = false;
      return;
    }
    if (!_sameDate(lastDone!, t)) {
      doneToday = false;
    }
  }


  void toggleToday() {
    final today = DateTime.now();
    if (doneToday) {
      if (lastDone != null && _sameDate(lastDone!, today)) {
        doneToday = false;
        if (streak > 0) {
          streak -= 1;
        }
        lastDone = null;
      }
    } else {
      if (lastDone == null) {
        streak = 1;
      } else if (_wasYesterday(lastDone!, today)) {
        streak += 1;
      } else if (_sameDate(lastDone!, today)) {
        streak = streak;
      } else {
        streak = 1;
      }
      doneToday = true;
      lastDone = DateTime(today.year, today.month, today.day);
    }
  }

  bool _sameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }


  bool _wasYesterday(DateTime a, DateTime today) {
    final y = DateTime(today.year, today.month, today.day).subtract(const Duration(days: 1));
    return _sameDate(a, y);
  }
}
