import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'net_aware_method_channel.dart';

abstract class NetAwarePlatform extends PlatformInterface {
  /// Constructs a NetAwarePlatform.
  NetAwarePlatform() : super(token: _token);

  static final Object _token = Object();

  static NetAwarePlatform _instance = MethodChannelNetAware();

  /// The default instance of [NetAwarePlatform] to use.
  ///
  /// Defaults to [MethodChannelNetAware].
  static NetAwarePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NetAwarePlatform] when
  /// they register themselves.
  static set instance(NetAwarePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
