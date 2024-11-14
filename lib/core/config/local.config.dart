import 'package:ightanim/core/config/base.config.dart';

class LocalConfig implements BaseConfig {

  @override
  // TODO: implement url
  String get url => "http://192.168.1.3:8000";

  @override
  // TODO: implement apiHost
  String get apiHost => "192.168.1.3:8000";

  @override
  // TODO: implement apiFolder
  String get apiFolder => "/api";

  @override
  // TODO: implement isLocal
  bool get isLocal => true;

  @override
  // TODO: implement pusherChannel
  String get pusherChannel => 'channell';

}