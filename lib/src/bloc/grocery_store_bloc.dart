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

  void changeToNormal() {
    state = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    state = GroceryState.cart;
    notifyListeners();
  }
}
