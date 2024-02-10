import 'package:flow/src/common/common.dart';
import 'package:flow/src/constants/constants.dart';
import 'package:flow/src/features/auth/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeDrawer extends ConsumerWidget {
  final int currentPageIndex;
  final Function(int) onPageChanged;

  const HomeDrawer({
    super.key,
    required this.currentPageIndex,
    required this.onPageChanged,
  });

  VoidCallback onSignOut(BuildContext context, WidgetRef ref) {
    return () =>
        ref.read(authControllerProvider.notifier).signOut(context: context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserDetailsProvider).when(
          data: (currentUser) {
            return NavigationDrawer(
              selectedIndex: currentPageIndex,
              onDestinationSelected: onPageChanged,
              elevation: 1,
              children: [
                DrawerHeader(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        currentUser == null || currentUser.profilePic.isEmpty
                            ? UIConstants.iconicPictureUrl
                            : currentUser.profilePic,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        currentUser?.username ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 10,
                  ),
                  child: Text('General'),
                ),
                const NavigationDrawerDestination(
                  selectedIcon: Icon(Icons.book),
                  icon: Icon(Icons.book_outlined),
                  label: Text('Todos'),
                ),
                const NavigationDrawerDestination(
                  selectedIcon: Icon(Icons.local_shipping),
                  icon: Icon(Icons.local_shipping_outlined),
                  label: Text('Restock Order'),
                ),
                const NavigationDrawerDestination(
                  selectedIcon: Icon(Icons.shelves),
                  icon: Icon(Icons.shelves),
                  label: Text('On-shelf Check'),
                ),
                const NavigationDrawerDestination(
                  selectedIcon: Icon(Icons.inventory_2),
                  icon: Icon(Icons.inventory_2_outlined),
                  label: Text('My Products'),
                ),
                UIConstants.drawerDivider,
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Log Out'),
                  contentPadding: const EdgeInsets.only(left: 20),
                  onTap: onSignOut(context, ref),
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            print(stackTrace);

            return ErrorText(
              errorText: error.toString(),
            );
          },
          loading: () => const Loader(),
        );
  }
}
