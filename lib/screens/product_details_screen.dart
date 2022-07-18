import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopapp/provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments
        as String; // gives id of product
    final loadedproduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
        appBar: AppBar(
      title: Text(loadedproduct.title),
    ));
  }
}
