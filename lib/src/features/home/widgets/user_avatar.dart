import 'package:flow/src/common/common.dart';
import 'package:flow/src/features/auth/controllers/controllers.dart';
import 'package:flow/src/features/user_profile/view/user_profile_screen.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar({super.key});

  void onShowUserProfileScreen(BuildContext context, UserModel currentUser) {
    showModalBottomSheet(
      context: context,
      builder: (context) => UserProfileScreen(currentUser: currentUser),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserDetailsProvider).when(
          data: (currentUser) {
            if (currentUser == null) {
              return const Loader();
            }

            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  onShowUserProfileScreen(context, currentUser);
                },
                child: currentUser.profilePic.isEmpty
                    ? const Icon(
                        Icons.account_circle_outlined,
                        size: 30,
                      )
                    : CircleAvatar(
                        foregroundImage: NetworkImage(currentUser.profilePic),
                        backgroundColor: Colors.white,
                        radius: 15,
                      ),
              ),
            );
          },
          error: (error, stackTrace) {
            print(stackTrace);

            return ErrorText(
              errorText: error.toString(),
            );
          },
          loading: () => CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        );
  }
}
