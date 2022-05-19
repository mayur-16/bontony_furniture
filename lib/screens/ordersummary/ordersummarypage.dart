import 'dart:core';
import 'package:bontony_furniture/screens/ordersummary/widgets/paybutton.dart';
import 'package:bontony_furniture/screens/ordersummary/widgets/pricedetailscard.dart';
import 'package:bontony_furniture/screens/ordersummary/widgets/singleproductcard.dart';
import 'package:flutter/material.dart';

import '../../models/hivefurniture.dart';

class OrderSummaryPage extends StatefulWidget {
  final List<HiveFurniture> cartItems;
  const OrderSummaryPage({Key? key,required this.cartItems}) : super(key: key);
  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  late List<HiveFurniture> products;
  int totalvalue = 0;

  @override
  void initState() {
    super.initState();
    products=widget.cartItems;
    for (var element in products) {
      totalvalue += (element.quantity * element.retailprice).toInt();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Summary"),),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length+1,
          itemBuilder: (context,index){
          if(index<products.length)
            {
              return SingleProductCard(product: products[index]);
            }
          else
          {
           return Padding(
             padding:  const EdgeInsets.only(bottom: 50),
             child: PriceDetailsCard(totalamount: totalvalue,quantity: products.length,),
           );
          }
          }),
      bottomSheet: PayButton(paymentAmount: totalvalue.toString(),),
    );
  }
}
