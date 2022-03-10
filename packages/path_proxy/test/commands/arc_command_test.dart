import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_proxy/src/commands/commands.dart';

void main() {
  const offset = Offset(10, 20);
  const radius = Radius.circular(12);

  group('Arc Command', () {
    group('$ArcToPointCommand', () {
      test('apply should call path.arcToPoint', () {
        final path = _MockPath();
        const command = ArcToPointCommand(offset, radius, 4, true, false);
        command.apply(path);
        verify(
          () => path.arcToPoint(
            offset,
            radius: radius,
            rotation: 4,
            largeArc: true,
            clockwise: false,
          ),
        );
      });

      group('toFlutterString | toSvgString', () {
        test('should return correct string', () {
          const command = ArcToPointCommand(offset, radius, 4, true, false);
          expect(
            command.toFlutterString(),
            '..arcToPoint(Offset(10.0, 20.0), radius: Radius.circular(12.0), '
            'rotation: 4.0, largeArc: true, clockwise: false)',
          );
          expect(command.toSvgString(), 'A 12.0 12.0 4.0 1 0 10.0 20.0');
        });
      });
    });

    group('$RelativeArcToPointCommand', () {
      test('apply should call path.relativeArcToPoint', () {
        final path = _MockPath();
        const command =
            RelativeArcToPointCommand(offset, radius, 4, true, false);
        command.apply(path);
        verify(
          () => path.relativeArcToPoint(
            offset,
            radius: radius,
            rotation: 4,
            largeArc: true,
            clockwise: false,
          ),
        );
      });

      test('toFlutterString | toSvgString', () {
        const command =
            RelativeArcToPointCommand(offset, radius, 4, true, false);
        expect(
          command.toFlutterString(),
          '..relativeArcToPoint(Offset(10.0, 20.0), radius: '
          'Radius.circular(12.0), rotation: 4.0, largeArc: true, '
          'clockwise: false)',
        );
        expect(command.toSvgString(), 'a 12.0 12.0 4.0 1 0 10.0 20.0');
      });
    });
  });
}

class _MockPath extends Mock implements Path {}
