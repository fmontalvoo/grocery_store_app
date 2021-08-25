import 'dart:math';

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
    for (GroceryProductItem item in cart) {
      if (item.product.id == product.id) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductItem(product: product));
    notifyListeners();
  }

  void deleteProduct(GroceryProductItem item) {
    cart.remove(item);
    notifyListeners();
  }

  int countCartElements() => cart.fold<int>(
      0, (previousValue, element) => element.quantity + previousValue);

  double totalCart() => cart.fold<double>(
      0,
      (previousValue, element) =>
          previousValue + element.quantity * element.product.price);
}

class GroceryProductItem {
  GroceryProductItem({
    this.quantity = 1,
    @required this.product,
  });
  int quantity;
  final GroceryProduct product;

  void increment() {
    quantity++;
  }

  void decrement() {
    quantity--;
  }
}
