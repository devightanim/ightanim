
import 'package:ightanim/core/config/base.config.dart';

class DevConfig implements BaseConfig {

  @override
  // TODO: implement url
  String get url => "https://url.com";

  @override
  // TODO: implement apiHost
  String get apiHost => "hots.com";

  @override
  // TODO: implement apiFolder
  String get apiFolder => "/api";

  @override
  // TODO: implement isLocal
  bool get isLocal => false;

  @override
  // TODO: implement pusherChannel
  String get pusherChannel => 'channel ';
}