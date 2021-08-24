import 'package:flutter/material.dart';

import 'package:grocery_store_app/src/bloc/grocery_store_bloc.dart';
import 'package:grocery_store_app/src/providers/grocery_provider.dart';

import 'package:grocery_store_app/src/widgets/grocery_store_list.dart';

const backgroundColor = Color(0xFFF6F5F2);
const cartBarHeight = 120.0;
const _panelTransition = Duration(milliseconds: 500);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GroceryStoreBLoC bloc;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bloc = GroceryProvider.of(context).bloc;
    return AnimatedBuilder(
        animation: bloc,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                _AppBarGrocery(),
                Expanded(
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: _panelTransition,
                        curve: Curves.decelerate,
                        left: 0.0,
                        right: 0.0,
                        top: _getTopForWhitePanel(bloc.state, size),
                        height: size.height - kToolbarHeight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                          child: Container(
                            color: Colors.white,
                            child: GroceryStoreList(),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: _panelTransition,
                        curve: Curves.decelerate,
                        left: 0.0,
                        right: 0.0,
                        top: _getTopForBlackPanel(bloc.state, size),
                        height: size.height,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _onVerticalGesture(DragUpdateDetails details) {
    // print(details.primaryDelta);
    if (details.primaryDelta < -7) {
      bloc.changeToCart();
    } else if (details.primaryDelta > 7) {
      bloc.changeToNormal();
    }
  }

  double _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal)
      return -cartBarHeight;
    else if (state == GroceryState.cart)
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    return 0.0;
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal)
      return size.height - kToolbarHeight - cartBarHeight;
    else if (state == GroceryState.cart) return cartBarHeight / 2;
    return 0.0;
  }
}

class _AppBarGrocery extends StatelessWidget {
  const _AppBarGrocery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: kToolbarHeight,
        color: backgroundColor,
        child: Row(
          children: [
            BackButton(
              color: Colors.black,
            ),
            Expanded(
              child: Text(
                'Frutas y vegetales',
                style: TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () => null,
            )
          ],
        ),
      ),
    );
  }
}
