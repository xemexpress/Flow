import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double contentPadding;
  final Widget child;

  const CustomCard({
    super.key,
    required this.contentPadding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: contentPadding,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
