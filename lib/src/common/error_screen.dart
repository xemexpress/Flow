import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorText;

  const ErrorScreen({
    super.key,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorText(
        errorText: errorText,
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
    required this.errorText,
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorText),
    );
  }
}
