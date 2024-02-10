import 'package:flow/src/common/common.dart';
import 'package:flow/src/constants/constants.dart';
import 'package:flow/src/features/auth/controllers/controllers.dart';
import 'package:flow/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  const HomeScreen({
    super.key,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 3;

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
    Navigator.of(context).pop();
  }

  void onSignOut() {
    ref.read(authControllerProvider.notifier).signOut(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isAuthLoading = ref.watch(authControllerProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: IndexedStack(
              index: _page,
              alignment: Alignment.center,
              children: UIConstants.appBarTitles,
            ),
            // centerTitle: true,
            actions: const [
              UserAvatar(),
            ],
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            shadowColor: Theme.of(context).colorScheme.onBackground,
            elevation: 1,
          ),
          body: IndexedStack(
            index: _page,
            children: UIConstants.drawerPages,
          ),
          drawer: HomeDrawer(
            currentPageIndex: _page,
            onPageChanged: onPageChanged,
          ),
          floatingActionButton: FloatingActionButton.small(
            onPressed: null,
            child: SearchAnchor(
              isFullScreen: true,
              builder: (context, controller) {
                return const Icon(Icons.search_outlined);
              },
              suggestionsBuilder: (context, controller) {
                return [];
              },
            ),
          ),
        ),
        if (isAuthLoading)
          const Opacity(
            opacity: 0.4,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isAuthLoading) const Loader(),
      ],
    );
  }
}
