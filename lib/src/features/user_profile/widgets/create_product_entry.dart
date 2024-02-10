import 'package:flow/src/features/products/view/create_product_screen.dart';
import 'package:flutter/material.dart';

class CreateProductEntry extends StatelessWidget {
  const CreateProductEntry({
    super.key,
  });

  void onCreateProduct(BuildContext context) {
    Navigator.of(context).pushReplacement(CreateProductScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.inventory_2_outlined),
      title: const Text('Create Product'),
      onTap: () {
        onCreateProduct(context);
      },
    );
  }
}
