
import 'package:ightanim/core/config/environment.config.dart';

class AppContent{
  static String apiUrl = Environment().config!.apiHost;
  static String url = Environment().config!.url;
  static String apiFolder = Environment().config!.apiFolder;
  static String pusherChannel = Environment().config!.pusherChannel;
  static String pusherApiKey = "18010b56901cde0c6df0";
  static String pusherCluster = "eu";
}