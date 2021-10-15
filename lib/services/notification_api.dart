import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notification = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'my love',
        importance: Importance.max,
        priority: Priority.high,
        channelDescription: "channel description",
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initSchedule = false}) async {
    tz.initializeTimeZones();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _notification.initialize(settings, onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });

    if (initSchedule) {
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future<void> showScheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required tz.TZDateTime scheduledDate,
    required int frequency,
  }) async {
    _notification.zonedSchedule(
      id,
      title,
      body,
      _scheduleMonthly(tzDateTime: scheduledDate, frequency: frequency),
      await _notificationDetails(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }

  static Future<void> showPendingNotifications() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
    await _notification.pendingNotificationRequests();

    pendingNotificationRequests.map((e) => print(e.title)).toList();
  }

  static Future<void> cancel(int id) async {
    await _notification.cancel(id);
  }

  static Future<void> cancelAll() async {
    await _notification.cancelAll();
  }

  static tz.TZDateTime _scheduleMonthly({required tz.TZDateTime tzDateTime, required int frequency}) {
    int t = 1;
    switch (frequency) {
      case 0:
        t = 1;
        break;
      case 1:
        t = 3;
        break;
      case 2:
        t = 6;
        break;
      case 3:
        t = 12;
        break;
      default:
        t = 1;
    }
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tzDateTime;
    if (scheduleDate.isBefore(now)) {
      int lackYear = now.year - tzDateTime.year;
      int lackMonth = now.month - tzDateTime.month + (lackYear * 12);
      int passedMonth = lackMonth % t;
      int needMonth = t - passedMonth;
      int year = needMonth ~/ 12;
      int month = needMonth % 12;
      scheduleDate = tz.TZDateTime(tz.local, now.year + year, now.month + month, tzDateTime.day, tzDateTime.hour, tzDateTime.minute);
    }
    print(scheduleDate.toString());
    return scheduleDate;
  }
}
