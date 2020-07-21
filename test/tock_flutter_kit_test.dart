import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tock_flutter_kit/tock_flutter_kit.dart';

void main() {
  const MethodChannel channel = MethodChannel('tock_flutter_kit');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TockFlutterKit.platformVersion, '42');
  });
}
