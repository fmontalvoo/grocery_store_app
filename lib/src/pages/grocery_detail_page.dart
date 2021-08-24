import 'package:flutter/material.dart';
import 'package:grocery_store_app/src/models/grocery_product.dart';

class GroceryDetailPage extends StatelessWidget {
  const GroceryDetailPage({
    Key key,
    this.product,
  }) : super(key: key);
  final GroceryProduct product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: product.id,
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
