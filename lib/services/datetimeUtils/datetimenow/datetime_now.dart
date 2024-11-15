import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DateTimeNow {
  final DateTime dateTime;

  DateTimeNow({DateTime? dateTime}) : dateTime = dateTime ?? DateTime.now();

  String getTime() {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return "$hours:$minutes";
  }

  String getDate() {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  String getDay() {
    return DateFormat('EEE').format(dateTime);
  }
}

final dateTimeNowStreamProvider = StreamProvider<DateTimeNow>((ref) {
  final controller = StreamController<DateTimeNow>();

  controller.add(DateTimeNow());

  final now = DateTime.now();
  final int secondsUntilNextMinute = 60 - now.second;
  final initialDelay = Duration(seconds: secondsUntilNextMinute);

  Timer? minuteTimer;

  void emitAtMinuteMark() {
    minuteTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      if (controller.isClosed) {
        timer.cancel();
        return;
      }
      controller.add(DateTimeNow());
    });
  }

  Timer(initialDelay, emitAtMinuteMark);

  ref.onDispose(() {
    minuteTimer?.cancel();
    controller.close();
  });

  return controller.stream;
});
