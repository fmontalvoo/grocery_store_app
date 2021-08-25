import 'package:flutter/material.dart';
import 'package:grocery_store_app/src/models/grocery_product.dart';

import 'package:grocery_store_app/src/pages/home_page.dart';
import 'package:grocery_store_app/src/pages/grocery_detail_page.dart';

import 'package:grocery_store_app/src/providers/grocery_provider.dart';

import 'package:grocery_store_app/src/widgets/staggered_dual_view.dart';

class GroceryStoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(
        top: cartBarHeight + 25.0,
        left: 10.0,
        right: 10.0,
      ),
      child: StaggeredDualView(
        spacing: 20.0,
        aspectRatio: 0.7,
        offsetPercent: 0.21,
        itemCount: bloc.products.length,
        itemBuilder: (context, index) {
          final product = bloc.products[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, __) {
                  return FadeTransition(
                    opacity: animation,
                    child: GroceryDetailPage(
                      product: product,
                      onProductAdded: () {
                        bloc.addProduct(product);
                      },
                    ),
                  );
                },
              ));
            },
            child: _ProductItem(product: product),
          );
        },
      ),
    );
    // return ListView.builder(
    //   padding: const EdgeInsets.only(top: cartBarHeight),
    //   itemCount: bloc.products.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       height: 100.0,
    //       width: 100.0,
    //       color: Colors.primaries[index % Colors.primaries.length],
    //     );
    //   },
    // );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  final GroceryProduct product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: 'ID_${product.id}',
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text('\$${product.price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0,
                )),
            const SizedBox(height: 10.0),
            Text(product.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 14.0,
                )),
            Text(product.weight,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 14.0,
                )),
          ],
        ),
      ),
    );
  }
}
