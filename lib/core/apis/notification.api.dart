import 'dart:convert' as convert;
import 'package:ightanim/core/config/api.config.dart';

class NotificationService {
  static dynamic _dataResponse;
  static int statusCode = 200;

  static Future<bool> detectNotification() async {
    var response = await ApiCache.getByToken('notification/get');
    statusCode = response.statusCode!;
    if (response.statusCode == 200) {
      _dataResponse = response.data
          // .map((notificationJson) => Notifications.fromJson(notificationJson))
          .toList();
      return true;
    }
    return false;
  }
  static Future<bool> updateStatus(int notificationId, int status) async {
    final requestBody = {
      'notification_id': notificationId,
      'is_readed':  status,
    };
    var response = await Api.getResponseByToken(
      'notification/update/status',
      requestBody,
    );
    statusCode = response.statusCode;
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 422) {
      return false;
    }
    return false;
  }
  static dynamic getResponse() {
    return _dataResponse;
  }
}
