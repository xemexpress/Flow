import 'package:flow/src/common/error_screen.dart';
import 'package:flow/src/common/loading_screen.dart';
import 'package:flow/src/features/auth/controllers/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flow/generated/l10n.dart';
import 'package:flow/src/features/home/view/home_screen.dart';
import 'package:flow/src/features/auth/view/log_in_screen.dart';
import 'package:flow/src/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TheFlow extends ConsumerStatefulWidget {
  const TheFlow({
    super.key,
  });

  @override
  ConsumerState<TheFlow> createState() => _TheFlowState();
}

class _TheFlowState extends ConsumerState<TheFlow> with WidgetsBindingObserver {
  late ThemeModeNotifier _themeModeNotifier;
  late final WidgetsBinding _widgetsBinding;

  @override
  void initState() {
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addObserver(this);
    _themeModeNotifier = ThemeModeNotifier(
      ValueNotifier<Brightness>(
        _widgetsBinding.platformDispatcher.platformBrightness,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _widgetsBinding.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _themeModeNotifier.changeBrightness(
      brightness: _widgetsBinding.platformDispatcher.platformBrightness,
    );

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _themeModeNotifier.appBrightness,
      builder: (context, brightness, child) {
        return MaterialApp(
          onGenerateTitle: (context) => 'Flow | ${S.current.slogan}',
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.defaultTheme(brightness),
          home: ref.watch(currentUserProvider).when(
            data: (currentUser) {
              if (currentUser == null) {
                return const LogInScreen();
              } else {
                return const HomeScreen();
              }
            },
            error: (error, stackTrace) {
              print(stackTrace);

              return ErrorScreen(
                errorText: error.toString(),
              );
            },
            loading: () {
              return const LoadingScreen();
            },
          ),
        );
      },
    );
  }
}
