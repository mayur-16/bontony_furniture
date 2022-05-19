import 'package:badges/badges.dart';
import 'package:bontony_furniture/bloc/cartitemcounter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/hivefurniture.dart';
import '../../cart/mycartpage.dart';

class ProductDetailsPageAppBar{
  AppBar getAppBar({required final CartItemCounter controller,required Box<HiveFurniture> box}){
    return AppBar(
      title: const Text("Description"),

      actions: [
        GetBuilder<CartItemCounter>(
          builder: (_){
            return Badge(
              badgeContent:   Text(
                "${controller.numberofitems}",
                style: const TextStyle(color: Colors.white70),
              ),
              position: BadgePosition.topEnd(top: 0, end: 5),
              badgeColor: Colors.green,
              child: IconButton(
                  onPressed: () {
                    Get.to(()=>MyCart(cartbox: box));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  )),
            );
          },

        )
      ],
    );
  }

}