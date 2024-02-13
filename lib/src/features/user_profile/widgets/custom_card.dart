import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Function(BuildContext) onClick;
  final String title;

  const CustomCard({
    super.key,
    required this.onClick,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: const Icon(Icons.inventory_2_outlined),
          title: Text(title),
          onTap: () => onClick(context),
        ),
      ),
    );
  }
}
