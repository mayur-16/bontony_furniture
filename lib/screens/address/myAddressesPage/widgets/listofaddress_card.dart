import 'package:bontony_furniture/screens/address/myAddressesPage/widgets/address_card.dart';
import 'package:flutter/material.dart';

import '../../../../models/hiveaddress.dart';

class ListOfAddressCards extends StatefulWidget {
  final List<HiveAddress> listofaddresses;
  final Function(int?) onvaluechanged;
  const ListOfAddressCards({Key? key,required this.listofaddresses,required this.onvaluechanged}) : super(key: key);

  @override
  State<ListOfAddressCards> createState() => _ListOfAddressCardsState();
}

class _ListOfAddressCardsState extends State<ListOfAddressCards> {
  int? val;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: widget.listofaddresses.length,
          itemBuilder: (_, index) {
           return AddressCard(index: index, value: val,address: widget.listofaddresses.elementAt(index),
               onvaluechanged: (value){
                 widget.onvaluechanged(value);
              setState(() {
                val=value;
              });
            });
          }),
    );
  }
}
