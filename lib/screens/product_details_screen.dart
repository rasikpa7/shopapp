import 'dart:ffi';

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
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
          child: Image.network(loadedproduct.imageUrl,
          fit: BoxFit.cover,),),

          SizedBox(height: 10,),
          Text('\$${loadedproduct.price}',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20
          ),),

           SizedBox(height: 10,),
           Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
             child: Text(loadedproduct.description,
             textAlign: TextAlign.center,
             softWrap:true ,),
           )
        ],
      ),
    )
    ,);
  }
}
