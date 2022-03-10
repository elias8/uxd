import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_proxy/src/commands/commands.dart';

void main() {
  group('$CloseCommand', () {
    test('apply should call path.close', () {
      final path = _MockPath();
      const command = CloseCommand();
      command.apply(path);

      verify(path.close).called(1);
    });

    group('toFlutterString | toSvgString', () {
      test('should return correct string', () {
        const command = CloseCommand();
        expect(command.toFlutterString(), '..close()');
        expect(command.toSvgString(), 'Z');
      });
    });
  });
}

class _MockPath extends Mock implements Path {}
