import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/hiveaddress.dart';

class AddAddressPage extends StatefulWidget {
  final Box<HiveAddress> addressbox;
  const AddAddressPage({Key? key,required this.addressbox}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _formKey = GlobalKey<FormState>();
  String contactnamevalue='',contactphnovalue='',addressnamevalue='',areanamevalue='',
      blocknovalue='',streetnovalue='',buildingnovalue='',flatnovalue='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add delivery address"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Name *",
                    hintText: "Enter contact person's name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter user name";
                    }else{
                      contactnamevalue=value;
                    }
                    return null;
                  },
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Address *",
                          hintText: "Enter address name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter address name";
                          }else{
                            addressnamevalue=value;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Area *",
                          hintText: "Enter area name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter area name";
                          }else{
                            areanamevalue=value;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Block no *",
                          hintText: "Enter block number",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter block no";
                          }else{
                            blocknovalue=value;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Street no *",
                          hintText: "Enter Street number",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter street no";
                          }else{
                            streetnovalue=value;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Building no *",
                          hintText: "Enter building number",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter building no";
                          }else{
                            buildingnovalue=value;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Flat no *",
                          hintText: "Enter Flat number",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter flat no";
                          }else{
                            flatnovalue=value;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Contact number *",
                    hintText: "Enter contact number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter contact no";
                    }else{
                      contactphnovalue=value;
                    }
                    return null;
                  },
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 50,
        width: double.infinity,
        child:
            ElevatedButton(onPressed: () {
              validateInputsandAddaddress();
            }, child: const Text("Add Address")),
      ),
    );
  }

  void validateInputsandAddaddress() async{
    if(_formKey.currentState!.validate()){
      log("logged in");
      log("$contactnamevalue $contactphnovalue $addressnamevalue $areanamevalue $blocknovalue $streetnovalue $buildingnovalue "
          "$flatnovalue");

      HiveAddress hiveAddress=HiveAddress(contactname: contactnamevalue, contactphno: contactphnovalue,
          addname: addressnamevalue, addarea: areanamevalue, addblockno: blocknovalue, addstreetno: streetnovalue,
          addbuildingno: buildingnovalue, addflatno: flatnovalue);

      await widget.addressbox.add(hiveAddress);
      Get.snackbar('New address', 'added Successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          duration: const Duration(milliseconds: 1300));

      Get.close(1);
    }
  }
}
