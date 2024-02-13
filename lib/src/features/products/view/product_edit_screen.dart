import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';

class ProductDetailEditScreen extends StatelessWidget {
  static route({required Product product}) => MaterialPageRoute(
        builder: (context) => ProductDetailEditScreen(
          product: product,
        ),
      );

  final Product _product;

  const ProductDetailEditScreen({
    super.key,
    required Product product,
  }) : _product = product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: const Center(
        child: Text('Hi'),
      ),
    );
  }
}
