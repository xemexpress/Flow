import 'package:flow/src/features/auth/controllers/controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserDetailsProvider = FutureProvider((ref) {
  final currentUserId = ref.watch(currentUserProvider).value!.$id;
  final currentUserDetails = ref.watch(userDetailsProvider(currentUserId));

  return currentUserDetails.value;
});
