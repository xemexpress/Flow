import 'package:flow/src/core/core.dart';
import 'package:flow/src/features/products/controllers/controllers.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends ConsumerStatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  void onDeleteProduct() async {
    ref
        .read(
          productControllerProvider.notifier,
        )
        .deleteProduct(
          product: widget.product,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.product.id),
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.onError,
                ),
                onPressed: onDeleteProduct,
              ),
            ),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(9, 10, 9, 0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.1),
              spreadRadius: 3,
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Card(
          elevation: 1,
          shadowColor: Theme.of(context).colorScheme.onBackground,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Theme.of(context).colorScheme.background,
            splashColor: Theme.of(context).colorScheme.secondaryContainer,
            onTap: () {
              print('Go to detail page.');
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: widget.product.imageLinks.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.memoryNetwork(
                      height: 56,
                      width: 56,
                      image:
                          resizeCloudinaryImage(widget.product.imageLinks[0]),
                      placeholder: kTransparentImage,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(
                    Icons.inventory_2_outlined,
                    size: 56,
                  ),
            title: Text(
              widget.product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text('1234'),
            trailing: const Icon(
              Icons.circle,
              color: Colors.green,
              size: 10,
            ),
          ),
        ),
      ),
    );
  }
}
