import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_proxy/src/commands/commands.dart';

void main() {
  group('Move Command', () {
    group('$MoveToCommand', () {
      test('apply should call path.moveTo', () {
        const command = MoveToCommand(1, 2);
        final path = _MockPath();
        command.apply(path);

        verify(() => path.moveTo(1, 2));
      });

      group('toFlutterString | toSvgString', () {
        test('should return correct string', () {
          const command = MoveToCommand(1, 2);
          expect(command.toFlutterString(), '..moveTo(1.0, 2.0)');
          expect(command.toSvgString(), 'M 1.0 2.0');
        });
      });
    });

    group('$RelativeMoveToCommand', () {
      group('toFlutterString | toSvgString', () {
        test('should return correct string', () {
          const command = RelativeMoveToCommand(1, 2);
          expect(command.toFlutterString(), '..relativeMoveTo(1.0, 2.0)');
          expect(command.toSvgString(), 'm 1.0 2.0');
        });
      });
    });
  });
}

class _MockPath extends Mock implements Path {}
