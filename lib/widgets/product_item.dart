// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';
import 'package:shopapp/provider/product.dart';
import 'package:shopapp/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  ProductItem(
      {Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);
    final cart =Provider.of<Cart>(context,listen: false);
    print('build called main');
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
            leading: Consumer<Product>(builder: (context, product, _) => 
               IconButton(onPressed: (){
                      product.toggleFavoriteStatus();
              }, icon: product.isFavorite?
              
                  const Icon(Icons.favorite,color: Colors.redAccent,):  const Icon(Icons.favorite_border)
              ),
            ),
            title: Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(onPressed: (){

              cart.addItem(product.id, product.price, product.title);

            }, icon: const Icon(Icons.shopping_cart)),
            backgroundColor: Colors.black.withOpacity(0.8)),
      ),
    );
  }
}
