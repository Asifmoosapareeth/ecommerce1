import 'package:get/get.dart';
import '../model/product_model.dart';
class CartController extends GetxController {
  var items = <Product>[].obs;
  var quantities = <int, int>{}.obs;

  void addToCart(Product product) {
    quantities[product.id] = (quantities[product.id] ?? 0) + 1;
    if (!items.contains(product)) {
      items.add(product);
    }
  }

  void removeFromCart(Product product) {
    if (quantities[product.id]! > 1) {
      quantities[product.id] = quantities[product.id]! - 1;
    } else {
      quantities.remove(product.id );
      items.remove(product);
    }
  }

  int getQuantity(Product product) {
    return quantities[product.id] ?? 0;
  }

  int get totalQuantity {
    return quantities.values.fold(0, (sum, quantity) => sum + quantity);
  }

  double get totalPrice => items.fold(0, (sum, item) => sum + item.price * getQuantity(item));
}