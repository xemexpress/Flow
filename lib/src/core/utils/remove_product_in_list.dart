import 'package:flow/src/models/models.dart';

void removeProductInList(Product deletedProduct, List<Product> products) {
  products.removeWhere((product) => product.id == deletedProduct.id);
}
