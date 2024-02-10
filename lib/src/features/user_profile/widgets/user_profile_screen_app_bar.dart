import 'package:flutter/material.dart';

class UserProfileScreenAppBar extends StatelessWidget {
  const UserProfileScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Done',
            style: TextStyle(
              color: Colors.transparent,
            ),
          ),
          Text(
            'Account',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Done',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
