import 'package:appwrite/appwrite.dart';
import 'package:flow/src/apis/apis.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getLatestProductsProvider = StreamProvider.autoDispose<RealtimeMessage>(
  (ref) {
    final productAPI = ref.watch(productAPIProvider);

    return productAPI.getLatestProducts();
  },
);
