import 'package:flow/src/common/common.dart';
import 'package:flow/src/constants/constants.dart';
import 'package:flow/src/core/core.dart';
import 'package:flow/src/features/products/controllers/controllers.dart';
import 'package:flow/src/features/products/widgets/product_card.dart';
import 'package:flow/src/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProductsScreen extends ConsumerWidget {
  const MyProductsScreen({super.key});

  void updateProducts(data, List<Product> products) {
    if (checkHappened(
      data.events,
      AppwriteConstants.productCreateEvent,
    )) {
      final createdProduct = Product.fromMap(data.payload);

      if (!products.contains(createdProduct)) {
        products.insert(0, createdProduct);
      }
    } else if (checkHappened(
      data.events,
      AppwriteConstants.productUpdateEvent,
    )) {
      final updatedProduct = Product.fromMap(data.payload);

      updateProductInList(updatedProduct, products);
    } else if (checkHappened(
      data.events,
      AppwriteConstants.productDeleteEvent,
    )) {
      final deletedProduct = Product.fromMap(data.payload);

      removeProductInList(deletedProduct, products);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getProductsProvider).when(
          data: (products) {
            return ref.watch(getLatestProductsProvider).when(
              data: (data) {
                // Streaming
                updateProducts(data, products);

                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 30),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(
                      product: product,
                    );
                  },
                  itemCount: products.length,
                );
              },
              error: (error, stackTrace) {
                print(stackTrace);

                return ErrorText(
                  errorText: error.toString(),
                );
              },
              loading: () {
                // First time loading
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 30),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(product: product);
                  },
                  itemCount: products.length,
                );
              },
            );
          },
          error: (error, stackTrace) {
            return ErrorText(
              errorText: error.toString(),
            );
          },
          loading: () => const Loader(),
        );
  }
}
