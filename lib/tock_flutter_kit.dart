import 'dart:async';

import 'package:flutter/services.dart';

class TockFlutterKit {
  static const MethodChannel _channel =
      const MethodChannel('tock_flutter_kit');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
