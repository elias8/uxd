import 'package:flutter/material.dart';

import '../../board/board.dart';

/// {@template design_board}
/// A widget that handles all drawings.
/// {@endtemplate}
class DesignBoard extends StatelessWidget {
  ///{@macro design_board}
  const DesignBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoardWidget(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 428,
              height: 928,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 428,
              height: 928,
              color: Colors.white,
            ),
          ),
          Align(
            child: Container(
              width: 428,
              height: 928,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 428,
              height: 928,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 428,
              height: 928,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
