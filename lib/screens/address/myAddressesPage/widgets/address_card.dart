import 'package:flutter/material.dart';

import '../../../../models/hiveaddress.dart';


class AddressCard extends StatelessWidget {
  final int index;
  final int? value;
  final HiveAddress address;
  final Function(int?) onvaluechanged;
  const AddressCard({Key? key,required this.index,required this.value,required this.address,required this.onvaluechanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return RadioListTile<int>(
      title: Text(address.contactname),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${address.addname} ,"),
            Text("${address.addflatno} , ${address.addbuildingno} ,"),
            Text("${address.addstreetno} , ${address.addblockno} ,"),
            Text(address.addarea),
          ],
        ),
      ),
      secondary: Text("phno :\n${address.contactphno}",style: const TextStyle(color: Colors.black45,fontSize: 14),),
      value: index,
      groupValue: value,
      contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      onChanged: ( changedval){
        onvaluechanged(changedval);
      },);
  }
}
