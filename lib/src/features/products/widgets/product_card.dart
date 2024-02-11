import 'package:flow/src/core/core.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
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
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      child: Container(
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
            splashColor: Colors.red,
            onTap: () {
              print('Delete');
            },
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
