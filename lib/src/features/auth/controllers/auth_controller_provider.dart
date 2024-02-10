import 'package:flow/src/apis/apis.dart';
import 'package:flow/src/features/auth/controllers/controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
    userAPI: ref.watch(userAPIProvider),
  );
});
