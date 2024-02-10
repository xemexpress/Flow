import 'package:appwrite/appwrite.dart';
import 'package:flow/src/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appwriteRealtimeProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);

  return Realtime(client);
});
