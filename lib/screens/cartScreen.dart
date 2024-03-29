import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart' show Cart;
import 'package:shopapp/provider/orders.dart';
import 'package:shopapp/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    var amount = double.parse(cart.totalAmout.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$ ${amount}',
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false)
                            .addOrder(cart.items.values.toList(), amount);
                        cart.clear();
                      },
                      child: const Text('ORDER NOW!'))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return cart.items == null
                        ? Center(child: Text('Cart is empty'))
                        : Cartitem(
                            productId: cart.items.keys.toList()[index],
                            id: cart.items.values.toList()[index].id,
                            price: cart.items.values.toList()[index].price,
                            quantity:
                                cart.items.values.toList()[index].quantity,
                            title: cart.items.values.toList()[index].title);
                  }),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: cart.itemCount))
        ],
      ),
    );
  }
}
