import 'package:flow/src/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/appwrite.dart';

final appwriteClientProvider = Provider<Client>((ref) {
  final client = Client()
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(status: true);

  return client;
});
