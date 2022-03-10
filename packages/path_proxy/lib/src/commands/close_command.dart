// ignore_for_file: public_member_api_docs
import 'dart:ui';

import 'package:meta/meta.dart';

import 'path_command.dart';

@immutable
class CloseCommand implements PathCommand {
  const CloseCommand();

  @override
  void apply(Path path) => path.close();

  @override
  String toFlutterString() => '..close()';

  @override
  String toSvgString() => 'Z';
}
