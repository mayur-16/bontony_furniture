

import 'package:bontony_furniture/screens/address/addAddressPage/add_address_page.dart';
import 'package:bontony_furniture/screens/address/myAddressesPage/widgets/listofaddress_card.dart';
import 'package:bontony_furniture/screens/ordersummary/ordersummarypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/hiveaddress.dart';
import '../../../models/hivefurniture.dart';

class AddressesPage extends StatefulWidget {
  final Box<HiveAddress> addressbox;
  final List<HiveFurniture> cartItems;
  const AddressesPage({Key? key,required this.addressbox,required this.cartItems}) : super(key: key);

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {

  ///initialize list of addresses
  List<HiveAddress> listofaddresses=[];

  ///selected address index
  int? selectedAddressindex;

  @override
  void initState() {
super.initState();
    getlistofAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Addresses"),
        centerTitle: true,
      ),
      body: Column(
        children:  [
          TextButton(onPressed: () async{
            Get.to(()=> AddAddressPage(addressbox: widget.addressbox,))?.then((_){
              getlistofAddresses();
              setState(() {});
            });
          },
          child: const Text("+ Add a new address")),
          const Divider(),
           ListOfAddressCards(listofaddresses: listofaddresses, onvaluechanged: (int? selectedval ) {
             selectedAddressindex=selectedval;
             },),
        ],
      ),
      bottomSheet: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(onPressed: (){
          if(selectedAddressindex==null){
            Get.snackbar("Select delivery address","please pick an address",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red,
                colorText: Colors.white,
                margin: const EdgeInsets.all(10),
                duration: const Duration(seconds: 2));
          }else{
            Get.to(()=>OrderSummaryPage(cartItems: widget.cartItems));
          }


        }, child: const Text("DELIVER HERE")),
      ),
    );
  }

  void getlistofAddresses() {
    if(widget.addressbox.isNotEmpty){
      listofaddresses=widget.addressbox.values.toList();
    }
  }


}
