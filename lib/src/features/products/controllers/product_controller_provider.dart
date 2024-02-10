import 'package:flow/src/apis/apis.dart';
import 'package:flow/src/features/products/controllers/controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productControllerProvider =
    StateNotifierProvider<ProductControllerNotifier, bool>((ref) {
  return ProductControllerNotifier(
    productAPI: ref.watch(productAPIProvider),
  );
});
