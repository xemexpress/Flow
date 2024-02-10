import 'package:flow/src/core/core.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 10),
          ).scale(1),
        ],
      ),
      child: Card(
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        elevation: 3,
        shadowColor: Theme.of(context).colorScheme.onBackground,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          tileColor: Theme.of(context).colorScheme.background,
          splashColor: Colors.red,
          onTap: () {},
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: product.imageLinks.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.memoryNetwork(
                    height: 56,
                    width: 56,
                    image: resizeCloudinaryImage(product.imageLinks[0]),
                    placeholder: kTransparentImage,
                    fit: BoxFit.cover,
                  ),
                )
              : const Icon(
                  Icons.inventory_2_outlined,
                  size: 56,
                ),
          title: Text(product.name),
          subtitle: Text(product.barcode),
        ),
      ),
    );
  }
}
