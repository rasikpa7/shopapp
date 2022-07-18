import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/provider/products.dart';
import 'package:shopapp/widgets/product_item.dart';

class ProdutsGrid extends StatelessWidget {

  final bool showFav;

   ProdutsGrid({
    Key? key,  required this.showFav,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =showFav? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (BuildContext context, index) {
        return ChangeNotifierProvider.value(
          value :products[index],
          child: ProductItem(
            // id: products[index].id,
            // title: products[index].title,
            // imageUrl: products[index].imageUrl,
          ),
        );
      },
    );
  }
}
