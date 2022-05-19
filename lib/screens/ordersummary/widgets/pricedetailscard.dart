
import 'package:flutter/material.dart';

class PriceDetailsCard extends StatelessWidget {
  final int totalamount;
  final int quantity;

  const PriceDetailsCard({Key? key, required this.totalamount,required this.quantity}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text("Price details :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price  ($quantity items)"),
                Text("BHD $totalamount"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Delivery Charges"),
                Text("BHD 5"),
              ],
            ),
            const Divider(height: 20,thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Amount",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("BHD ${totalamount+5}",style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              ],
            ),
            const Divider(height: 20,thickness: 2),
          ],
        ),
      ),
    );
  }
}
