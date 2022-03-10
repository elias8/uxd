import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_proxy/src/commands/commands.dart';

void main() {
  group('Quadratic Bezier Command', () {
    group('$QuadraticBezierToCommand', () {
      test('apply should call path.quadraticBezierTo', () {
        const command = QuadraticBezierToCommand(1, 2, 3, 4);
        final path = _MockPath();
        command.apply(path);

        verify(() => path.quadraticBezierTo(1, 2, 3, 4));
      });

      group('toFlutterString | toSvgString', () {
        test('should return correct string', () {
          const command = QuadraticBezierToCommand(1, 2, 3, 4);
          expect(
            command.toFlutterString(),
            '..quadraticBezierTo(1.0, 2.0, 3.0, 4.0)',
          );
          expect(command.toSvgString(), 'Q 1.0 2.0 3.0 4.0');
        });
      });
    });

    group('$RelativeQuadraticBezierToCommand', () {
      test('apply should call path.relativeQuadraticBezierTo', () {
        const command = RelativeQuadraticBezierToCommand(1, 2, 3, 4);
        final path = _MockPath();
        command.apply(path);

        verify(() => path.relativeQuadraticBezierTo(1, 2, 3, 4));
      });

      group('toFlutterString | toSvgString', () {
        test('should return correct string', () {
          const command = RelativeQuadraticBezierToCommand(1, 2, 3, 4);
          expect(
            command.toFlutterString(),
            '..relativeQuadraticBezierTo(1.0, 2.0, 3.0, 4.0)',
          );
          expect(command.toSvgString(), 'q 1.0 2.0 3.0 4.0');
        });
      });
    });
  });
}

class _MockPath extends Mock implements Path {}
