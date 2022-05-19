import 'package:badges/badges.dart';
import 'package:bontony_furniture/bloc/cartitemcounter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/hivefurniture.dart';
import '../../cart/mycartpage.dart';

class HomePageAppBar {
  AppBar getAppBar({required BuildContext context,required Box<HiveFurniture> cartbox,
    required CartItemCounter cartItemCounter}){

    return AppBar(
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ));
      }),
      //backgroundColor: const Color(0xffffffff),
      title: const Text(
        "Bontony furniture",
      ),
      actions: [
        Badge(
          badgeContent:  GetBuilder<CartItemCounter>(
            builder: (_){
              return  Text(
                "${cartItemCounter.numberofitems}",
                style: const TextStyle(color: Colors.white70),
              );
            },
          ),
          position: BadgePosition.topEnd(top: 0, end: 5),
          badgeColor: Colors.green,
          child: IconButton(
              onPressed: () {
                Get.to(()=>MyCart(cartbox: cartbox));
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
              )),
        )
      ],
    );

  }
}

