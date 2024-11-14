import 'package:ightanim/core/config/base.config.dart';
import 'package:ightanim/core/config/dev.config.dart';
import 'package:ightanim/core/config/local.config.dart';
import 'package:ightanim/core/config/prod.config.dart';

class Environment {
  static final Environment _singleton = Environment._internal();

  factory Environment() {
    return _singleton;
  }
  Environment._internal();
  static const String dev = 'DEV';
  static const String prod = 'PROD';
  static const String local = 'LOCAL';

  BaseConfig? config;

  initConfig(String environment) {
    config = _getConfig(environment) as BaseConfig?;
  }

  Object _getConfig(String environment) {
    switch (environment) {
      case Environment.local:
        return LocalConfig();
      case Environment.dev:
        return DevConfig();
      case Environment.prod:
        return ProdConfig();
      default:
        return DevConfig();
    }
  }


}