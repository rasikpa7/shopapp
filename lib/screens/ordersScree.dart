import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import'package:shopapp/provider/orders.dart'show Orders;
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/order_item.dart'as ordcard;

import 'package:shopapp/provider/orders.dart';


class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
static const routeName='/orders';
  @override
  Widget build(BuildContext context) {
final orderData=Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Orders'),
      ),

      body: ListView.builder(itemCount: orderData.orders.length,

        itemBuilder: ((context, index) {
        
        return ordcard.OrderItem(order: orderData.orders[index],);
      })),
    );

    
  }
}