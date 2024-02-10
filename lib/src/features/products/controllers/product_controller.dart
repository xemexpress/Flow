import 'package:flow/src/apis/product_api.dart';
import 'package:flow/src/core/core.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductControllerNotifier extends StateNotifier<bool> {
  final ProductAPI _productAPI;

  ProductControllerNotifier({
    required ProductAPI productAPI,
  })  : _productAPI = productAPI,
        super(false);

  void createProduct({
    required String name,
    required String barcode,
    required int quantity,
    required List<String> tags,
    required String remarks,
    required BuildContext context,
  }) async {
    Product product = Product(
      id: '', // it will be taken care in the API
      name: name,
      barcode: barcode,
      quantity: quantity,
      followers: const [],
      imageLinks: const [],
      patches: const [],
      tags: tags,
      remarks: remarks,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    state = true;
    final res = await _productAPI.createProduct(product);
    state = false;

    res.fold(
      (l) => showSnackBar(context: context, message: l.message),
      (productDocument) => showSnackBar(
          context: context,
          message:
              '${Product.fromMap(productDocument.data).name} created successfully!'),
    );
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
}
