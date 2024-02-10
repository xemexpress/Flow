import 'package:flutter/material.dart';

class ProductTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final IconData selectedIcon;
  final String labelText;
  final VoidCallback onUpdateWidget;
  final TextInputType? keyboardType;
  final int? iconQuarterTurns;
  final int? maxLines;

  const ProductTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.selectedIcon,
    required this.labelText,
    required this.onUpdateWidget,
    this.keyboardType,
    this.iconQuarterTurns,
    this.maxLines,
  });

  @override
  State<ProductTextField> createState() => _ProductTextFieldState();
}

class _ProductTextFieldState extends State<ProductTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        prefixIcon: widget.iconQuarterTurns == null
            ? Icon(
                _focusNode.hasFocus ? widget.selectedIcon : widget.icon,
              )
            : RotatedBox(
                quarterTurns: widget.iconQuarterTurns!,
                child: Icon(
                  _focusNode.hasFocus ? widget.selectedIcon : widget.icon,
                ),
              ),
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
      ),
      onTap: widget.onUpdateWidget,
      onChanged: (value) => widget.onUpdateWidget(),
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
    );
  }
}
