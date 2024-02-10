import 'package:flow/src/constants/constants.dart';
import 'package:flow/src/features/user_profile/widgets/widgets.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final UserModel currentUser;

  const UserProfileScreen({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    const double cardPaddingHorizonal = 10.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserProfileScreenAppBar(),
          UIConstants.verticalSpace,
          CustomCard(
            contentPadding: cardPaddingHorizonal,
            child: UserProfileEntry(
              currentUser: currentUser,
              cardPaddingHorizonal: cardPaddingHorizonal,
            ),
          ),
          UIConstants.verticalSpace,
          const CustomCard(
            contentPadding: cardPaddingHorizonal,
            child: CreateProductEntry(),
          ),
        ],
      ),
    );
  }
}
