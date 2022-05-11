import 'package:dart_async_storage/async_storage_reader.dart';
import 'package:test/test.dart';
import 'package:platform/src/testing/fake_platform.dart';

void main() {
  group(AsyncStorageReader, () {
    test('delegates to [AsyncStorageAndroid] on Android', () {
      expect(
          AsyncStorageReader(FakePlatform(operatingSystem: 'android'))
              is AsyncStorageAndroid,
          isTrue);
    });

    test('delegates to [AsyncStorageIOS] on iOS', () {
      expect(
          AsyncStorageReader(FakePlatform(operatingSystem: 'ios'))
              is AsyncStorageIOS,
          isTrue);
    });

    test('throws for a [Platform] other than iOS or Android', () {
      expect(() => AsyncStorageReader(FakePlatform(operatingSystem: '')),
          throwsA(isA<UnimplementedError>()));
    });
  });

  // [AsyncStorageAndroid._read] is not useful to test directly, since there is
  // no in-memory test mock of SQFLite.
}
