import 'package:flow/generated/l10n.dart';
import 'package:flow/src/common/loading_screen.dart';
import 'package:flow/src/features/auth/controllers/auth_controller_provider.dart';
import 'package:flow/src/features/auth/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      );

  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _emailFocusNode.addListener(() {
      setState(() {});
    });

    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  void superSignIn() async {
    ref.read(authControllerProvider.notifier).superSignIn(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
  }

  void updateWidget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Motto(message: S.of(context).helloWorld),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        AuthInput(
                          controller: _emailController,
                          icon: Icons.email_outlined,
                          hintText: S.of(context).pageLogInEmail,
                          onChange: updateWidget,
                          keyboardType: TextInputType.emailAddress,
                          currentFocusNode: _emailFocusNode,
                          nextFocusNode: _passwordFocusNode,
                        ),
                        const SizedBox(height: 10),
                        AuthInput(
                          controller: _passwordController,
                          icon: Icons.key_outlined,
                          hintText: S.of(context).pageLogInPassword,
                          currentFocusNode: _passwordFocusNode,
                          onChange: updateWidget,
                          onSubmitted: superSignIn,
                          obscureText: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    StartUserButton(
                      onStartUser: superSignIn,
                      buttonText: S.of(context).pageLogInStart,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isLoading)
          const Opacity(
            opacity: 0.4,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isLoading) const Loader(),
      ],
    );
  }
}
