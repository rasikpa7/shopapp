import 'package:flutter/material.dart';
import 'package:shopapp/provider/orders.dart'as ord;
import 'package:intl/intl.dart';
class OrderItem extends StatelessWidget {
  final ord.OrderItem order;
   OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle:Text(DateFormat('dd/mm/yyyy  hh:mm').format(order.dateTime)),
            trailing: IconButton(icon: Icon(Icons.expand_more)
            ,onPressed: (){

            }),
          )
        ],
      ),
    );
    
  }
}