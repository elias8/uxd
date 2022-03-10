import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_proxy/src/commands/commands.dart';

void main() {
  group('Line Command', () {
    group('$LineToCommand', () {
      test('apply should call path.lineTo', () {
        const command = LineToCommand(1, 2);
        final path = _MockPath();
        command.apply(path);

        verify(() => path.lineTo(1, 2));
      });

      group('toFlutterString | toSvgString', () {
        test('should return correct string', () {
          const command = LineToCommand(1, 2);
          expect(command.toFlutterString(), '..lineTo(1.0, 2.0)');
          expect(command.toSvgString(), 'L 1.0 2.0');
        });
      });
    });

    group('$RelativeLineToCommand', () {
      test('apply should call path.relativeLineTo', () {
        const command = RelativeLineToCommand(1, 2);
        final path = _MockPath();
        command.apply(path);

        verify(() => path.relativeLineTo(1, 2));
      });

      group('toFlutterString | toSvgString', () {
        test('should return correct string', () {
          const command = RelativeLineToCommand(1, 2);
          expect(command.toFlutterString(), '..relativeLineTo(1.0, 2.0)');
          expect(command.toSvgString(), 'l 1.0 2.0');
        });
      });
    });
  });
}

class _MockPath extends Mock implements Path {}
