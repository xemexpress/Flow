import 'package:flow/src/features/products/controllers/controllers.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProductsProvider =
    FutureProvider.autoDispose<List<Product>>((ref) async {
  final products =
      await ref.read(productControllerProvider.notifier).getProducts();

  return products;
});
