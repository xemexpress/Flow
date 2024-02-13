import 'package:carousel_slider/carousel_slider.dart';
import 'package:flow/src/features/products/view/product_edit_screen.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static route(Product product) => MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          product: product,
        ),
      );

  final Product _product;

  const ProductDetailScreen({
    super.key,
    required Product product,
  }) : _product = product;

  void onEditProduct(BuildContext context) {
    Navigator.of(context).push(
      ProductDetailEditScreen.route(product: _product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => onEditProduct(context),
              icon: const Icon(Icons.edit_outlined),
            ),
          ),
        ],
      ),
      body: Column(children: [
        CarouselSlider(
          items: _product.imageLinks
              .map((e) => Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(e)))
              .toList(),
          options: CarouselOptions(
              // height: 300,
              ),
        ),
      ]),
    );
  }
}
