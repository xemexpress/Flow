import 'dart:io';

import 'package:flow/src/apis/product_api.dart';
import 'package:flow/src/apis/storage_api.dart';
import 'package:flow/src/core/core.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductControllerNotifier extends StateNotifier<bool> {
  final ProductAPI _productAPI;
  final StorageAPI _storageAPI;

  ProductControllerNotifier({
    required ProductAPI productAPI,
    required StorageAPI storageAPI,
  })  : _productAPI = productAPI,
        _storageAPI = storageAPI,
        super(false);

  void createProduct({
    required String name,
    required String barcode,
    required int quantity,
    required List<File> images,
    required List<String> tags,
    required String remarks,
    required BuildContext context,
    VoidCallback? whenCreated,
  }) async {
    state = true;

    if (images.isNotEmpty) {
      final res = await _storageAPI.uploadImages(images);
      res.fold(
        (failure) {
          showSnackBar(context: context, message: failure.message);
        },
        (imageLinks) async {
          Product product = Product(
            id: '', // it will be taken care in the API
            name: name,
            barcode: barcode,
            quantity: quantity,
            tags: tags,
            remarks: remarks,
            imageLinks: imageLinks,
            followers: const [],
            patches: const [],
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          final res = await _productAPI.createProduct(product);
          state = false;

          res.fold(
            (failure) {
              showSnackBar(context: context, message: failure.message);
            },
            (productDocument) {
              whenCreated?.call();

              showSnackBar(
                context: context,
                message:
                    '${Product.fromMap(productDocument.data).name} created successfully!',
              );
            },
          );
        },
      );
    }
    state = false;
  }

  Future<List<Product>> getProducts() async {
    final res = await _productAPI.getProducts();

    return res
        .map(
          (productDocument) => Product.fromMap(
            productDocument.data,
          ),
        )
        .toList();
  }

  void deleteProduct({
    required Product product,
    required BuildContext context,
  }) async {
    state = true;

    final res = await _productAPI.deleteProduct(product);
    state = false;

    res.fold(
      (failure) {
        showSnackBar(context: context, message: failure.message);
      },
      (_) {
        showSnackBar(
          context: context,
          message: '${product.name} deleted successfully!',
        );
      },
    );
  }
}
