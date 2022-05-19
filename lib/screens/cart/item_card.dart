
import 'package:bontony_furniture/models/hivefurniture.dart';
import 'package:bontony_furniture/screens/cart/item_inc_dec.dart';
import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  final HiveFurniture productData;
  final VoidCallback ondeleteItemClicked;
  final Function(int) onQuantitychanged;
  const ItemCard({Key? key,required this.productData,required this.ondeleteItemClicked,required this.onQuantitychanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: const Color(0xffe7f1f0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(productData.description,maxLines:4,textAlign:TextAlign.center,style: const TextStyle(fontSize: 13,color: Color(0xff345372),fontWeight: FontWeight.bold),),
                          //Text("${productData.remarks?.substring(0,18)??""} ...",style: const TextStyle(fontSize: 12,color: Colors.black45),),
                          Text(
                            "BHD ${productData.retailprice} /-",style: const TextStyle(fontSize: 16,
                            color: Colors.blueGrey,),)
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ItemIncrementDecrement(quantity:productData.quantity,onQuantitychanged: (int val){
                      onQuantitychanged(val);
                    }),
                    OutlinedButton(onPressed: (){
                      ondeleteItemClicked();
                    }, child: const Text("Remove")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
