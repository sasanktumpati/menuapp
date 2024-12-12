import '../data/models/meal_timings.dart';

class TimingUtils {
  static String formatTime(String time) {
    final parts = time.split(':');
    if (parts.length != 2) return time;

    final hour = int.tryParse(parts[0]);
    if (hour == null) return time;

    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : hour;
    return '$displayHour:${parts[1]} $period';
  }

  static String getMealTiming(MealType timing) {
    return '${formatTime(timing.start)} - ${formatTime(timing.end)}';
  }

  static Timings getTimingsForDate(MealTimings config, DateTime date) {
    final specialDay = config.specialDays.firstWhere(
      (day) => day.date.year == date.year && 
               day.date.month == date.month && 
               day.date.day == date.day,
      orElse: () => SpecialDay(
        date: date,
        name: '',
        timings: date.weekday == DateTime.sunday
            ? config.sundayTimings
            : config.defaultTimings,
      ),
    );

    return specialDay.timings;
  }

  static MealType getCurrentMealTiming(Timings timings, DateTime now) {
    final currentTime = '${now.hour}:${now.minute}';

    if (isTimeBetween(
        currentTime, timings.breakfast.start, timings.breakfast.end)) {
      return timings.breakfast;
    }
    if (isTimeBetween(currentTime, timings.lunch.start, timings.lunch.end)) {
      return timings.lunch;
    }
    if (isTimeBetween(currentTime, timings.dinner.start, timings.dinner.end)) {
      return timings.dinner;
    }

    if (isTimeBefore(currentTime, timings.breakfast.start))
      return timings.breakfast;
    if (isTimeBefore(currentTime, timings.lunch.start)) return timings.lunch;
    if (isTimeBefore(currentTime, timings.dinner.start)) return timings.dinner;

    return timings.breakfast;
  }

  static bool isTimeBetween(String time, String start, String end) {
    return _compareTime(time, start) >= 0 && _compareTime(time, end) <= 0;
  }

  static bool isTimeBefore(String time, String target) {
    return _compareTime(time, target) < 0;
  }

  static int _compareTime(String time1, String time2) {
    try {
      final t1 = time1.split(':').map(int.parse).toList();
      final t2 = time2.split(':').map(int.parse).toList();
      if (t1.length != 2 || t2.length != 2 ||
          t1[0] < 0 || t1[0] > 23 || t1[1] < 0 || t1[1] > 59 ||
          t2[0] < 0 || t2[0] > 23 || t2[1] < 0 || t2[1] > 59) {
        throw FormatException('Invalid time format');
      }
      if (t1[0] != t2[0]) return t1[0].compareTo(t2[0]);
      return t1[1].compareTo(t2[1]);
    } catch (e) {
      throw FormatException('Invalid time format: $e');
    }
  }
}
