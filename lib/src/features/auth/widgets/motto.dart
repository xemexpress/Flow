import 'package:flutter/material.dart';

class Motto extends StatelessWidget {
  final String message;
  const Motto({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
