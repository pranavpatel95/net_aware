/*
import 'package:flutter_test/flutter_test.dart';
import 'package:net_aware/net_aware.dart';
import 'package:net_aware/net_aware_platform_interface.dart';
import 'package:net_aware/net_aware_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNetAwarePlatform
    with MockPlatformInterfaceMixin
    implements NetAwarePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NetAwarePlatform initialPlatform = NetAwarePlatform.instance;

  test('$MethodChannelNetAware is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNetAware>());
  });

  test('getPlatformVersion', () async {
    NetAware netAwarePlugin = NetAware();
    MockNetAwarePlatform fakePlatform = MockNetAwarePlatform();
    NetAwarePlatform.instance = fakePlatform;

    expect(await netAwarePlugin.getPlatformVersion(), '42');
  });
}
*/
