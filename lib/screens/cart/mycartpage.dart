import 'dart:async';

import 'package:bontony_furniture/main.dart';
import 'package:bontony_furniture/screens/address/myAddressesPage/my_addresses_page.dart';
import 'package:bontony_furniture/screens/cart/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../bloc/cartitemcounter.dart';
import '../../models/hivefurniture.dart';

class MyCart extends StatefulWidget {
  final Box<HiveFurniture> cartbox;

  const MyCart({Key? key, required this.cartbox}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<HiveFurniture> cartItems = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  ///initiate Get controller
  final CartItemCounter controller=Get.find();

  @override
  void initState() {
    super.initState();
    cartItems = widget.cartbox.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    //int cartlength = cartItems!.length; //implement for better code

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: cartItems.isNotEmpty
          ? AnimatedList(
            shrinkWrap: true,
            key: listKey,
            //used to build both item cards and remove all buttons
            initialItemCount: cartItems.length + 1,
            itemBuilder: (context, index, animation) {
              if (index < cartItems.length) {
                return _buildItemWidget(
                    productdata: cartItems[index], animation: animation);
              } else {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 80),
                  child: OutlinedButton(
                      onPressed: () async {
                        ///delete every items from the mycart box
                        await cartbox.clear();

                        ///set the number of cart items for displaying in badge
                        controller.setnumberofitems(0);

                        for (var item in cartItems) {
                          listKey.currentState!.removeItem(
                              0,
                              (_, animation) => _buildItemWidget(
                                  productdata: item,
                                  animation: animation),
                              duration:
                                  const Duration(milliseconds: 400));
                        }

                        Future.delayed(const Duration(milliseconds: 400),
                            () {
                          setState(() {
                            cartItems.clear();
                          });
                        });
                      },
                      child: const Text("Remove All")),
                );
              }
            })
          : const Center(
              child: Text("Your cart is empty!"),
            ),
      bottomSheet:  SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              if(cartItems.isNotEmpty){
                Get.to(()=>AddressesPage(addressbox: addressbox,cartItems: cartItems));
              }
              else{
                Get.snackbar("Cart is Empty", "Please add items!",
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(10),
                    duration: const Duration(seconds: 2));
              }
            },
            child: const Text("Proceed")),
      ),
    );
  }

  Widget _buildItemWidget(
      {required HiveFurniture productdata, required Animation animation}) {
    return SlideTransition(
      position: animation
          .drive(Tween(begin: const Offset(-1.0, 0), end: Offset.zero)),
      child: ItemCard(
        productData: productdata,
        onQuantitychanged: (int qty) async {
          ///save the quantity updates to hive box
          productdata.quantity = qty;
          await productdata.save();
        },
        ondeleteItemClicked: () async {

          int indexofitem = cartItems.indexOf(productdata);
          await cartbox.deleteAt(indexofitem); //delete item from box
          cartItems.removeAt(indexofitem); //delete item  from global list variable

          ///set the number of cart items for displaying in badge
          controller.setnumberofitems(cartbox.values.length);

          if (cartItems.isEmpty)
          {
            setState(() {});
          } else {
            listKey.currentState!.removeItem(
                indexofitem,
                (_, animation) => _buildItemWidget(
                    productdata: productdata, animation: animation),
                duration: const Duration(milliseconds: 500));
          }
        },
      ),
    );
  }
}
