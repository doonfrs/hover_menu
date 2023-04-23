library hover_menu;

import 'package:flutter/material.dart';

class HoverMenu extends StatefulWidget {
  final Widget title;
  final double? width;
  final List<Widget> items;

  const HoverMenu({
    Key? key,
    required this.title,
    this.items = const [],
    this.width,
  }) : super(key: key);

  @override
  HoverMenuState createState() => HoverMenuState();
}

class HoverMenuState extends State<HoverMenu> {
  OverlayEntry? _overlayEntry;
  final _focusNode = FocusNode();
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _removeOverlay();
    }
  }

  void _removeOverlay() {
    _isHovered = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      focusNode: _focusNode,
      onHover: (isHovered) {
        if (isHovered && !_isHovered) {
          _focusNode.requestFocus();
          _isHovered = true;
        }
      },
      onPressed: () {},
      child: widget.title,
    );
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      maintainState: true,
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: widget.width ?? 200,
        child: TextButton(
          onPressed: () {},
          onHover: (isHovered) {
            if (isHovered && _isHovered) {
              _focusNode.requestFocus();
            } else {
              _focusNode.unfocus();
            }
          },
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: widget.items,
          ),
        ),
      ),
    );
  }
}
