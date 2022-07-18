import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';
import 'package:shopapp/provider/product.dart';
import 'package:shopapp/provider/products.dart';
import 'package:shopapp/screens/cartScreen.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/product_grid_widget.dart';
import 'package:shopapp/widgets/badge.dart';


 enum  FilterOptions{
      favorites,
      all
      
    }
class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {

   bool _showOnlyFavorites=false;
  @override
  Widget build(BuildContext context) {
    final productsContainer=Provider.of<Products>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),

        actions: [
          PopupMenuButton(onSelected: (FilterOptions value) {
         setState(() {
           
            if(value==FilterOptions.favorites){
            _showOnlyFavorites=true;
          }else{
           _showOnlyFavorites=false;  
          }

         });
          },
            itemBuilder: (context) => [
             PopupMenuItem(child: Text('Only Favorite'),value: FilterOptions.favorites,),
             PopupMenuItem(child: Text('Show All'),value: FilterOptions.all,),

          ],
          ),
          Consumer<Cart>(builder: (_,cartData,ch)=> Badge(
            child: ch!,
           value: cartData.itemCount.toString(),),
           child: IconButton(onPressed: (){

           Navigator.of(context).pushNamed(CartScreen.routeName);

           }, icon: const Icon(Icons.shopping_cart))),
       
      
        ],
      ),
      drawer: AppDrawer(),
      body: ProdutsGrid(showFav: _showOnlyFavorites),
    );
  }
}


