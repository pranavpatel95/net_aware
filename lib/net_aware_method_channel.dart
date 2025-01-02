import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'net_aware_platform_interface.dart';

/// An implementation of [NetAwarePlatform] that uses method channels.
class MethodChannelNetAware extends NetAwarePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('net_aware');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
