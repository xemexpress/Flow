import 'package:flutter/material.dart';

class StartUserButton extends StatelessWidget {
  final String buttonText;
  final Function() onStartUser;

  const StartUserButton({
    super.key,
    required this.buttonText,
    required this.onStartUser,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
      onPressed: onStartUser,
      child: Text(buttonText),
    );
  }
}
