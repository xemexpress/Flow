import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final FocusNode currentFocusNode;
  final void Function() onChange;
  final TextInputType keyboardType;
  final bool obscureText;
  final FocusNode? nextFocusNode;
  final void Function()? onSubmitted;

  const AuthInput({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.currentFocusNode,
    required this.onChange,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.nextFocusNode,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      focusNode: currentFocusNode,
      onChanged: (value) => onChange(),
      onSubmitted: (value) {
        if (nextFocusNode == null) {
          onSubmitted?.call();
        } else {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        prefixIcon: Icon(icon),
        suffixIcon: controller.text.isEmpty || !currentFocusNode.hasFocus
            ? null
            : IconButton(
                onPressed: () {
                  controller.clear();
                  onChange();
                },
                icon: Icon(
                  Icons.cancel,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
      ),
    );
  }
}
