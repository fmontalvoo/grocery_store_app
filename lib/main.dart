import 'package:flutter/material.dart';
import 'package:grocery_store_app/src/bloc/grocery_store_bloc.dart';
import 'package:grocery_store_app/src/pages/home_page.dart';
import 'package:grocery_store_app/src/providers/grocery_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GroceryProvider(
      bloc: GroceryStoreBLoC(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        // routes: {'home': (context) => HomePage()},
      ),
    );
  }
}
