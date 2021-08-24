import 'package:flutter/material.dart';
import 'package:grocery_store_app/src/bloc/grocery_store_bloc.dart';

class GroceryProvider extends InheritedWidget {
  final GroceryStoreBLoC bloc;
  final Widget child;

  GroceryProvider({@required this.bloc, @required this.child});

  static GroceryProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroceryProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
