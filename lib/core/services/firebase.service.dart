import 'dart:developer';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService extends GetxService {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<FirebaseMessagingService> init() async {
    await Firebase.initializeApp();

    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      onEvent(message);
    });


    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    String? token = await messaging.getToken();
    log("Firebase Messaging Token: $token");

    return this;
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    log("Handling a background message: ${message.messageId}");
  }

  onEvent(RemoteMessage message) {
    log("============================ event ============================");
    log("Message ID     : ${message.messageId}");
    log("Message Title  : ${message.notification?.title}");
    log("Message Body   : ${message.notification?.body}");
    log("Data           : ${message.data}");
    log("===============================================================");
  }
}
