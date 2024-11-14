
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:ightanim/contents/app.content.dart';
import 'package:ightanim/core/config/environment.config.dart';
import 'package:ightanim/core/controllers/app.controller.dart';

class Api {
  static Uri getUri(String segment) {
    return Environment().config!.isLocal
        ? Uri.http(AppContent.apiUrl, "${AppContent.apiFolder}/$segment")
        : Uri.https(AppContent.apiUrl, "${AppContent.apiFolder}/$segment");
  }

  static Future<http.Response> getResponse(String segment, Map<String, dynamic> body) async {
    return await _getHttpResponse(segment, body, null);
  }

  static Future<http.Response> getResponseByToken(String segment, Map<String, dynamic> body) async {
    return await _getHttpResponse(segment, body, AppController.storageData.value.authToken);
  }

  static Future<http.Response> deleteResponseByToken(String segment) async {
    return await _deleteHttpResponse(segment, AppController.storageData.value.authToken);
  }
  static Future<http.Response> _getHttpResponse(String segment, Map<String, dynamic> body, String? token) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return await http.post(
      getUri(segment),
      headers: headers,
      body: convert.jsonEncode(body),
    );
  }

  static Future<http.Response> _deleteHttpResponse(String segment, String? token) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return await http.delete(
      getUri(segment),
      headers: headers,
    );
  }
}
class ApiCache {
  static Future<Response> get(String segment) async {
    return await _dioConfig(segment, null);
  }

  static Future<Response> getByToken(String segment) async {
    return await _dioConfig(segment, AppController.storageData.value.authToken);
  }

  static Future<Response> _dioConfig(String segment, String? token) async {
    Dio dio = Dio();
    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    Options options = buildCacheOptions(
      const Duration(days: 10),
      maxStale: const Duration(days: 30),
      forceRefresh: true,
      options: Options(headers: headers),
    );
    dio.interceptors.add(dioCacheManager.interceptor);

    return await dio.getUri(Api.getUri(segment), options: options);
  }
}
