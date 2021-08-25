import 'package:flutter/material.dart';
import 'package:grocery_store_app/src/models/grocery_product.dart';

class GroceryDetailPage extends StatefulWidget {
  const GroceryDetailPage({
    Key key,
    this.product,
    this.onProductAdded,
  }) : super(key: key);
  final GroceryProduct product;
  final VoidCallback onProductAdded;

  @override
  _GroceryDetailPageState createState() => _GroceryDetailPageState();
}

class _GroceryDetailPageState extends State<GroceryDetailPage> {
  String heroTag = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'ID_${widget.product.id}$heroTag',
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.product.weight,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Sobre el producto',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    widget.product.description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () => null,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: RaisedButton(
                    color: Color(0xFFF4C459),
                    shape: StadiumBorder(),
                    child: Text(
                      'Agregar al carrito',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () => _addToCart(context),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = '_details';
    });
    widget.onProductAdded();
    Navigator.pop(context);
  }
}
