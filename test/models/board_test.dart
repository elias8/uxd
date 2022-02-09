import 'package:flutter_test/flutter_test.dart';
import 'package:uxd/models/models.dart';
import 'package:vector_math/vector_math_64.dart';

void main() {
  group('$Board', () {
    test('should initialize correct values and matches', () {
      final initialBoard = Board(transform: Matrix4.identity());
      expect(initialBoard.width, 50000);
      expect(initialBoard.height, 50000);
      expect(initialBoard.zoomLevel, ZoomLevel.x100);
      expect(initialBoard, isNot(equals(Board(transform: Matrix4.zero()))));
    });
  });
}
