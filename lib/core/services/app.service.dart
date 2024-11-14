import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ightanim/core/config/environment.config.dart';
import 'package:ightanim/core/services/firebase.service.dart';

class AppServices extends GetxService {
  RxBool isConnected = RxBool(true);
  Future<AppServices> init() async {
    await initiationSystem();
    initiationEnv();
    if (isConnected.value) {
      await initFirebase();
    }
    return this;
  }
  Future<void> initiationSystem() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        isConnected.value = false;
      }
    });

  }
  void initiationEnv() {
    const String environment = String.fromEnvironment(
      'ENVIRONMENT',
      defaultValue: Environment.dev,
    );
    Environment().initConfig(environment);
  }
  Future<void> initFirebase() async{
    await Get.putAsync(() => FirebaseMessagingService().init());
  }
  //TODO::Handle Firebase

}
