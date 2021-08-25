import 'package:flutter/material.dart';

import 'package:grocery_store_app/src/models/grocery_product.dart';

enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoreBLoC with ChangeNotifier {
  GroceryState state = GroceryState.normal;
  List<GroceryProduct> products = List.unmodifiable(groceryProducts);
  List<GroceryProductItem> cart = [];

  void changeToNormal() {
    state = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    state = GroceryState.cart;
    notifyListeners();
  }

  void addProduct(GroceryProduct product) {
    cart.add(GroceryProductItem(product: product));
    notifyListeners();
  }
}

class GroceryProductItem {
  GroceryProductItem({
    this.quantity = 1,
    @required this.product,
  });
  int quantity;
  final GroceryProduct product;

  void add() {}

  void subtract() {}
}
