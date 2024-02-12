import 'package:flow/src/features/auth/controllers/auth_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDetailsProvider = FutureProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);

  return authController.getUserData(uid);
});
