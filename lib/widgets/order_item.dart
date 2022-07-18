import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopapp/provider/orders.dart'as ord;
import 'package:intl/intl.dart';
class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
   OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  bool _isExpanded=false;
  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle:Text(DateFormat('dd/mm/yyyy  hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(icon: Icon(_isExpanded?Icons.expand_less:Icons.expand_more)
            ,onPressed: (){
              setState(() {
                _isExpanded=!_isExpanded;
              });

            }),
          ),
          if(_isExpanded) Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4,),
            height: min(widget.order.products.length*20.0 +10,100),
            child:ListView(
                children: widget.order.products.map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('${e.quantity} x \$${e.price}',style: TextStyle(fontSize: 18,color:Colors.grey ),)
                  ],
                )).toList()
   
   )
              ),
             
        ],
      ),
    );
    
  }
}