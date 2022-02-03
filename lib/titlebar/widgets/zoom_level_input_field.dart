import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/l10n.dart';
import '../../toolbar/toolbar.dart';

/// {@template zoom_level_input_field}
/// An input field to change a design board zoom level.
///
/// The widget has text input field and a predefined pop up menu to select a
/// predefined zoom level.
/// {@template}
class ZoomLevelInputField extends StatefulWidget {
  /// {@macro zoom_level_input_field}
  const ZoomLevelInputField({Key? key}) : super(key: key);

  @override
  State<ZoomLevelInputField> createState() => _ZoomLevelInputFieldState();
}

class _ZoomLevelInputFieldState extends State<ZoomLevelInputField> {
  late final _toolbarBloc = context.read<ToolbarBloc>();
  late final _controller = TextEditingController();
  late final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final level = context.select<ToolbarBloc, ZoomLevel>(_selector).level;
    return BlocListener<ToolbarBloc, ToolbarState>(
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
            suffixIcon: PopupMenuButton<ZoomLevel>(
              padding: EdgeInsets.zero,
              offset: const Offset(36, 20),
              onSelected: _onZoomLevelSelected,
              child: const SizedBox.expand(
                child: Icon(Icons.expand_more_rounded, size: 18),
              ),
              itemBuilder: (_) =>
                  ZoomLevel.levels.map(_buildPopupMenuItem).toList(),
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

  void _blocListener(BuildContext context, ToolbarState state) {
    final level = state.zoomLevel.level;
    _controller.text = context.l10n.formattedZoomLevel(level);
  }

  PopupMenuItem<ZoomLevel> _buildPopupMenuItem(ZoomLevel zoomLevel) {
    return PopupMenuItem(
      height: 16,
      value: zoomLevel,
      child: Text(context.l10n.formattedZoomLevel(zoomLevel.level)),
    );
  }

  void _onFocusChanged() {
    final text = _controller.text;
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
    final zoom = ZoomLevel.tryParse(value);
    _toolbarBloc.add(ToolbarEvent.zoomLevelUpdated(zoom));
  }

  void _onZoomLevelSelected(ZoomLevel zoom) {
    _controller.text = context.l10n.formattedDecimalZoomLevel(zoom.level);
    _toolbarBloc.add(ToolbarEvent.zoomLevelUpdated(zoom));
  }

  ZoomLevel _selector(ToolbarBloc bloc) => bloc.state.zoomLevel;

  void _setTextValue() {
    final level = _toolbarBloc.state.zoomLevel.level;
    _controller.text = context.l10n.formattedDecimalZoomLevel(level);
  }

  bool _shouldListen(ToolbarState previous, ToolbarState current) {
    return previous.zoomLevel != current.zoomLevel;
  }
}
