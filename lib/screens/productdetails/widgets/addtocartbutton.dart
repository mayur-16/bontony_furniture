import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../bloc/cartitemcounter.dart';
import '../../../models/furniture.dart';
import '../../../models/hivefurniture.dart';
import '../../cart/mycartpage.dart';

class AddToCartButton extends StatefulWidget {
  final RecordsetofFurniture dataofproducts;
  final Box<HiveFurniture> cartbox;
  final String pcode;
  final CartItemCounter controller;

  const AddToCartButton({Key? key,required this.dataofproducts,required this.cartbox,required this.controller,required this.pcode}) : super(key: key);

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {

  List<HiveFurniture> cartItems = [];
  bool isProductaddedtoCart=false;

  @override
  void initState() {
    super.initState();
    cartItems=widget.cartbox.values.toList();
    checkWhetherAlreadyaddedtoCart();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async{

        if(isProductaddedtoCart)
          {
            ///navigate to Mycart page if product already added
            Get.to(()=>MyCart(cartbox: widget.cartbox));
          }
        else
          {
            HiveFurniture hivefurniture=HiveFurniture(pcode: widget.dataofproducts.pcode,
                description: widget.dataofproducts.description, remarks: widget.dataofproducts.remarks,
                retailprice: widget.dataofproducts.retailprice,quantity: 1);

            await widget.cartbox.add(hivefurniture);

            setState(() {
              isProductaddedtoCart=true;
              ///set the number of cart items for displaying in badge
              widget.controller.incrementnumofitems();
            });
          }
      },
      child:  Text(
        isProductaddedtoCart?"Go to cart":"Add to cart",
        style: const TextStyle(color: Colors.brown),
      ),
      style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.brown)),
    );
  }

  void checkWhetherAlreadyaddedtoCart() {
    for(HiveFurniture item in cartItems)
      {
        if(item.pcode==widget.pcode)
          {
            setState(() {
              isProductaddedtoCart=true;
            });
            break;
          }
      }
  }
}
