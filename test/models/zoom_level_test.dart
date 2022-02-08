import 'package:flutter_test/flutter_test.dart';
import 'package:uxd/models/models.dart';

void main() {
  group('$ZoomLevel', () {
    group('operator', () {
      test('should return correct value', () {
        expect(ZoomLevel.min < ZoomLevel.max, isTrue);
        expect(ZoomLevel.max > ZoomLevel.min, isTrue);
        expect(ZoomLevel.x100 == ZoomLevel.x100, isTrue);
      });
    });

    group('optimize', () {
      test(
          'should return the current or other ZoomLevel based on correct '
          'validation', () {
        expect(ZoomLevel.x100.optimize(), ZoomLevel.x100);
        expect(const ZoomLevel(0).optimize(), ZoomLevel.min);
        expect(const ZoomLevel(65).optimize(), ZoomLevel.max);
        expect(const ZoomLevel(20).optimize(), const ZoomLevel(20));
      });
    });

    group('tryParse', () {
      test('should return a correct ZoomLevel', () {
        expect(ZoomLevel.tryParse(''), isNull);
        expect(ZoomLevel.tryParse('invalid'), isNull);
        expect(ZoomLevel.tryParse('100'), ZoomLevel.x100);
        expect(ZoomLevel.tryParse('0'), const ZoomLevel(0));
        expect(ZoomLevel.tryParse('100.0'), ZoomLevel.x100);
      });
    });
  });
}
