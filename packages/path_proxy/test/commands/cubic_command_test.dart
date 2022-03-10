import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_proxy/src/commands/commands.dart';

void main() {
  group('$CubicToCommand', () {
    test('apply should call path.', () {
      const command = CubicToCommand(21.33, 22.44, 23.55, 24.66, 25.77, 26.88);
      final path = _MockPath();
      command.apply(path);

      verify(() => path.cubicTo(21.33, 22.44, 23.55, 24.66, 25.77, 26.88));
    });

    group('toFlutterString | toSvgString', () {
      test('should return correct string', () {
        const command = CubicToCommand(
          21.33,
          22.44,
          23.55,
          24.66,
          25.77,
          26.88,
        );
        expect(
          command.toFlutterString(),
          '..cubicTo(21.33, 22.44, 23.55, 24.66, 25.77, 26.88)',
        );
        expect(
          command.toSvgString(),
          'C 21.33 22.44 23.55 24.66 25.77 26.88',
        );
      });
    });
  });

  group('$RelativeCubicToCommand', () {
    test('apply should call path.relativeCubicTo', () {
      const command =
          RelativeCubicToCommand(21.33, 22.44, 23.55, 24.66, 25.77, 26.88);
      final path = _MockPath();
      command.apply(path);

      verify(
        () => path.relativeCubicTo(21.33, 22.44, 23.55, 24.66, 25.77, 26.88),
      );
    });

    group('toFlutterString | toSvgString', () {
      test('should return correct string', () {
        const command = RelativeCubicToCommand(
          21.33,
          22.44,
          23.55,
          24.66,
          25.77,
          26.88,
        );
        expect(
          command.toFlutterString(),
          '..relativeCubicTo(21.33, 22.44, 23.55, 24.66, 25.77, 26.88)',
        );
        expect(
          command.toSvgString(),
          'c 21.33 22.44 23.55 24.66 25.77 26.88',
        );
      });
    });
  });
}

class _MockPath extends Mock implements Path {}
