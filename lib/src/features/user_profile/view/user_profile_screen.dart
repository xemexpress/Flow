import 'package:flow/src/features/products/view/create_product_screen.dart';
import 'package:flow/src/features/user_profile/widgets/widgets.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final UserModel currentUser;

  const UserProfileScreen({
    super.key,
    required this.currentUser,
  });

  void onCreateProduct(BuildContext context) {
    Navigator.of(context).pushReplacement(CreateProductScreen.route());
  }

  void onCreateLocation(BuildContext context) {
    Navigator.of(context).pushReplacement(CreateProductScreen.route());
  }

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentUser.profilePic.isNotEmpty
                    ? CircleAvatar(
                        foregroundImage: NetworkImage(currentUser.profilePic),
                        backgroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        radius: 30,
                      )
                    : Icon(
                        Icons.account_circle_outlined,
                        size: 60,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                SizedBox(width: 10),
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
            ),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: Text(
                    'Create',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 26),
                  leading: const Icon(Icons.inventory_2_outlined),
                  title: const Text('Product'),
                  onTap: () {
                    onCreateProduct(context);
                  },
                ),
                const Divider(indent: 60, height: 0, thickness: 0.5),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 26),
                  leading: const Icon(Icons.location_on_outlined),
                  title: const Text('Location'),
                  onTap: () {
                    onCreateLocation(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
