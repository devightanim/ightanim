import 'dart:convert';
import 'package:get/get.dart';
import 'package:ightanim/core/models/storage.model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppController extends GetxController {
  static AppController instance = Get.find();
  static Rx<StorageModel> storageData = StorageModel(getStartedShow: false, rememberMe: false).obs;
  Future<void> setStoreData(String? token, String? email, bool rememberMe) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final data = StorageModel(
      authToken: token,
      email: email,
      getStartedShow: true,
      rememberMe: rememberMe,
    );
    pref.setString('storage_data_ightanim', jsonEncode(data.toJson()));
    storageData.value = data;
    update();
  }
  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('storage_data_ightanim');
  }
  Future<bool> checkAndGetStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool check = pref.containsKey('storage_data_ightanim');
    if (check) {
      var data = jsonDecode(pref.getString('storage_data_ightanim')!);
      storageData.value = StorageModel.fromMap(data);
    }
    return check;
  }
}