import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:localnotification/notifyController.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  Notify notify= Get.put(Notify());

  @override
  void initState() {
    super.initState();
    notify.initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  var image = ByteArrayAndroidBitmap(await notify.getImage(
                      "car"));
                  BigPictureStyleInformation big =
                      BigPictureStyleInformation(image);

                  AndroidNotificationDetails and = AndroidNotificationDetails(
                      "1", "anroid",
                      priority: Priority.high, importance: Importance.max);
                  NotificationDetails nd = NotificationDetails(android: and);

                  await notify.flnp!.show(1, "HELLO", "How are you?", nd);
                },
                child: Text("Local Notification"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  var image = ByteArrayAndroidBitmap(await notify.getImage(
                    "https://cars.tatamotors.com/images/performance-mobile-new.jpg"));
                  BigPictureStyleInformation big =
                      BigPictureStyleInformation(image);

                  AndroidNotificationDetails and = AndroidNotificationDetails(
                      "1", "anroid",
                      priority: Priority.high, importance: Importance.max);
                  NotificationDetails nd = NotificationDetails(android: and);

                  await notify.flnp!.zonedSchedule(
                      1,
                      "HELOO",
                      "How are you?"
                      tz.TZDateTime.now(tz.local).add(
                        Duration(seconds: 3),
                      ),
                      nd,
                      uiLocalNotificationDateInterpretation:
                          UILocalNotificationDateInterpretation.absoluteTime,
                      androidAllowWhileIdle: true);
                },
                child: Text("timer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
