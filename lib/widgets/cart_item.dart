
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';

class Cartitem extends StatelessWidget {
  final String id;
  final double price;
  final String productId;
  final int quantity;
  final String title;
   Cartitem({Key? key, required this.id, required this.productId, required this.price, required this.quantity, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Dismissible(
      onDismissed: (direction){
        Provider.of<Cart>(context,listen:  false).removeItem(productId);
      },
      key:ValueKey(id) ,
      background: Padding(
        padding: const EdgeInsets.all(5.0),
        
        child: Container(
          child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Remove from cart  '.toUpperCase(),style: TextStyle(color: Colors.white),),
              Icon(Icons.delete,color: Colors.white,)
            ],
          ),),
          color: Theme.of(context).errorColor,
        ),
      ),
      child: Card(margin: EdgeInsets.symmetric(horizontal: 15,
      vertical: 4),
        child: 
        Padding(padding: EdgeInsets.all(8),
        child: ListTile(leading: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Text('\$${price}')),
          ),
        ),
        title: Text(title),
        subtitle: Text('Total\$${price * quantity}'),
        trailing: Text('$quantity x $price'),
        ),)
      ),
    );
    
  }
}