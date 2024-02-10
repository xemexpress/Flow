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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getProductsProvider).when(
          data: (products) {
            return ref.watch(getLatestProductsProvider).when(
              data: (data) {
                for (var event in data.events) {
                  print(event);
                }

                if (data.events.contains(
                  'databases.*.collections.${AppwriteConstants.productsCollectionId}.documents.*.update',
                )) {
                  print('Updated!');

                  final updatedProduct = Product.fromMap(data.payload);
                  updateProductInList(
                    updatedProduct,
                    products,
                  );
                }

                return ListView.builder(
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(product: product);
                  },
                  itemCount: products.length,
                  padding: const EdgeInsets.only(
                    bottom: 30,
                  ),
                );
              },
              error: (error, stackTrace) {
                print(stackTrace.toString());
                return ErrorText(
                  errorText: error.toString(),
                );
              },
              loading: () {
                return ListView.builder(
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
            print(2);
            return ErrorText(
              errorText: error.toString(),
            );
          },
          loading: () => const Loader(),
        );
  }
}
