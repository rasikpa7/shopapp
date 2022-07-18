import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';
import 'package:shopapp/provider/orders.dart';
import 'package:shopapp/provider/products.dart';
import 'package:shopapp/screens/cartScreen.dart';
import 'package:shopapp/screens/ordersScree.dart';
import 'package:shopapp/screens/product_overview_screen.dart';
import 'screens/product_details_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products(),),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Orders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName:((context) => OrdersScreen())
        },
      ),
    );
  }
}
