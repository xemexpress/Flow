import 'package:flow/src/models/models.dart';

void updateProductInList(Product updatedProduct, List<Product> products) {
  for (int i = 0; i < products.length; i++) {
    if (products[i].id == updatedProduct.id) {
      products[i] = updatedProduct;
      break;
    }
  }
}
