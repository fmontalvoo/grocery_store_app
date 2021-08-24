import 'package:flutter/material.dart';

enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoreBLoC with ChangeNotifier {
  GroceryState state = GroceryState.normal;

  void changeToNormal() {
    state = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    state = GroceryState.cart;
    notifyListeners();
  }
}
