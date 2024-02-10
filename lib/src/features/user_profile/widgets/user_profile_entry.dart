import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';

class UserProfileEntry extends StatelessWidget {
  const UserProfileEntry({
    super.key,
    required this.currentUser,
    required this.cardPaddingHorizonal,
  });

  final UserModel currentUser;
  final double cardPaddingHorizonal;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        currentUser.profilePic.isNotEmpty
            ? CircleAvatar(
                foregroundImage: NetworkImage(currentUser.profilePic),
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                radius: 30,
              )
            : Icon(
                Icons.account_circle_outlined,
                size: 60,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        SizedBox(
          width: cardPaddingHorizonal,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentUser.nickname.isEmpty
                  ? currentUser.username
                  : currentUser.nickname,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              currentUser.email,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ],
        )
      ],
    );
  }
}
