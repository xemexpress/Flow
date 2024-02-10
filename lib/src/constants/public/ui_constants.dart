import 'package:flow/src/features/products/view/my_product_screen.dart';
import 'package:flutter/material.dart';

class UIConstants {
  static const List<Widget> appBarTitles = [
    Text('Todos'),
    Text('Restock Order'),
    Text('On-shelf Check'),
    Text('My Products'),
  ];

  static const List<Widget> drawerPages = [
    Center(child: Text('Todos Screen')),
    Center(child: Text('Restock Order Screen')),
    Center(child: Text('On-shelf Check Screen')),
    MyProductsScreen(),
  ];

  static const Widget drawerDivider = Divider(indent: 60);
  static const Widget verticalSpace = SizedBox(height: 30);

  // Image URLs
  static const String iconicPictureUrl =
      'https://res.cloudinary.com/unimemo-dfd94/image/upload/v1705308971/22487340_d7hjqv.jpg';
  static const String productImagePlaceholderUrl =
      'https://res.cloudinary.com/unimemo-dfd94/image/upload/v1705032368/flow/test_box.jpg';
}
