import 'package:flutter_test/flutter_test.dart';
import 'package:uxd/board/board.dart';

void main() {
  group('$BoardZoom', () {
    group('operator', () {
      test('should return correct value', () {
        expect(BoardZoom.min < BoardZoom.max, isTrue);
        expect(BoardZoom.max > BoardZoom.min, isTrue);
        expect(BoardZoom.x100 == BoardZoom.x100, isTrue);
      });
    });

    group('optimize', () {
      test(
          'should return the current or other BoardZoom based on correct '
          'validation', () {
        expect(BoardZoom.x100.optimize(), BoardZoom.x100);
        expect(const BoardZoom(0).optimize(), BoardZoom.min);
        expect(const BoardZoom(65).optimize(), BoardZoom.max);
        expect(const BoardZoom(20).optimize(), const BoardZoom(20));
      });
    });

    group('clamp', () {
      test('should return a correct value between the min and max level', () {
        expect(BoardZoom.clamp(0.5), 0.5);
        expect(BoardZoom.clamp(64), 64.0);
        expect(BoardZoom.clamp(0.001), BoardZoom.minLevel);
        expect(BoardZoom.clamp(10000), BoardZoom.maxLevel);
      });
    });

    group('tryParse', () {
      test('should return a correct BoardZoom', () {
        expect(BoardZoom.tryParse(''), isNull);
        expect(BoardZoom.tryParse('invalid'), isNull);
        expect(BoardZoom.tryParse('100'), BoardZoom.x100);
        expect(BoardZoom.tryParse('0'), const BoardZoom(0));
        expect(BoardZoom.tryParse('100.0'), BoardZoom.x100);
      });
    });
  });
}
