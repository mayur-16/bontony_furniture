import 'package:bontony_furniture/models/hivefurniture.dart';
import 'package:flutter/material.dart';

class SingleProductCard extends StatelessWidget {
  final HiveFurniture product;
  const SingleProductCard({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.25,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixl"
                      "ib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                  height: 100,
                  width: MediaQuery.of(context).size.width*0.40,
                  fit: BoxFit.fill,
                  isAntiAlias: false,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(product.description,maxLines:4,textAlign:TextAlign.center,style: const TextStyle(fontSize: 11,color: Color(0xff345372),fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Quantity : ${product.quantity}",style: const TextStyle(fontSize: 15,
                  color: Colors.black45,),),

                Text(
                  "BHD ${product.retailprice*product.quantity} /-",style: const TextStyle(fontSize: 15,
                  color: Colors.blueGrey,),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
