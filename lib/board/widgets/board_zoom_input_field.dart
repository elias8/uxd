import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../board/board.dart';
import '../../l10n/l10n.dart';

/// {@template board_zoom_input_field}
/// An input field to change a design board zoom level.
///
/// The widget has text input field and a predefined pop up menu to select a
/// predefined zoom level.
/// {@template}
class BoardZoomInputField extends StatefulWidget {
  /// {@macro board_zoom_input_field}
  const BoardZoomInputField({Key? key}) : super(key: key);

  @override
  State<BoardZoomInputField> createState() => _BoardZoomInputFieldState();
}

class _BoardZoomInputFieldState extends State<BoardZoomInputField> {
  late final _boarBloc = context.read<BoardBloc>();
  late final _controller = TextEditingController();
  late final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final level = context.select<BoardBloc, BoardZoom>(_selector).level;
    return BlocListener<BoardBloc, BoardState>(
      listenWhen: _shouldListen,
      listener: _blocListener,
      child: SizedBox(
        width: 72,
        height: 24,
        child: TextField(
          focusNode: _focusNode,
          controller: _controller,
          onSubmitted: _onZoomLevelChanged,
          style: GoogleFonts.ptSans(fontSize: 12, color: Colors.grey.shade800),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
          ],
          decoration: InputDecoration(
            hintText: l10n.formattedZoomLevel(level),
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 24,
              maxWidth: 24,
            ),
            suffixIcon: PopupMenuButton<BoardZoom>(
              padding: EdgeInsets.zero,
              offset: const Offset(36, 20),
              onSelected: _onZoomSelected,
              child: const SizedBox.expand(
                child: Icon(Icons.expand_more_rounded, size: 18),
              ),
              itemBuilder: (_) =>
                  BoardZoom.levels.map(_buildPopupMenuItem).toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _setTextValue();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  void _blocListener(BuildContext context, BoardState state) {
    final level = state.zoom.level;
    _controller.text = context.l10n.formattedZoomLevel(level);
  }

  PopupMenuItem<BoardZoom> _buildPopupMenuItem(BoardZoom zoom) {
    return PopupMenuItem(
      height: 16,
      value: zoom,
      child: Text(context.l10n.formattedZoomLevel(zoom.level)),
    );
  }

  void _onFocusChanged() {
    final text = _controller.text.trim();
    if (_focusNode.hasFocus) {
      _controller.text = text.replaceAll('%', '');
      _controller.selection = TextSelection(
        extentOffset: _controller.text.length,
        baseOffset: 0,
      );
    } else {
      _onZoomLevelChanged(text);
      _setTextValue();
    }
  }

  void _onZoomLevelChanged(String value) {
    final zoom = BoardZoom.tryParse(value);
    _boarBloc.add(BoardEvent.zoomChanged(zoom));
  }

  void _onZoomSelected(BoardZoom zoom) {
    _controller.text = context.l10n.formattedDecimalZoomLevel(zoom.level);
    _boarBloc.add(BoardEvent.zoomChanged(zoom));
  }

  BoardZoom _selector(BoardBloc bloc) => bloc.state.zoom;

  void _setTextValue() {
    final level = _boarBloc.state.zoom.level;
    _controller.text = context.l10n.formattedDecimalZoomLevel(level);
  }

  bool _shouldListen(BoardState previous, BoardState current) {
    return previous.zoom != current.zoom;
  }
}
