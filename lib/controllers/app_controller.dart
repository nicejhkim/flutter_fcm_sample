// app_controller.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  final Rxn<RemoteMessage> message = Rxn<RemoteMessage>();

  Future<bool> initialize() async {
    // Firebase 초기화부터 해야 Firebase Messaging 을 사용할 수 있다.
    await Firebase.initializeApp();

    // Android 에서는 별도의 확인 없이 리턴되지만, requestPermission()을 호출하지 않으면 수신되지 않는다.
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage rm) {
      message.value = rm;
    });

    return true;
  }
}
