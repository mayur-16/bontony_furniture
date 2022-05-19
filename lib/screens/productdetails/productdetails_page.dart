import 'package:bontony_furniture/models/furniture.dart';
import 'package:bontony_furniture/screens/productdetails/widgets/addtocartbutton.dart';
import 'package:bontony_furniture/screens/productdetails/widgets/appbar.dart';
import 'package:bontony_furniture/services/api_service.dart';
import 'package:bontony_furniture/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../bloc/cartitemcounter.dart';
import '../../models/hivefurniture.dart';

class ProductDetails extends StatelessWidget {
  final String pcode;
  final Box<HiveFurniture> box;

  ///initiate Get controller
  final CartItemCounter controller=Get.find();

    ProductDetails({Key? key, required this.pcode,required this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: ProductDetailsPageAppBar().getAppBar(controller: controller, box: box),

      body: FutureBuilder<Furniture>(
        future: MyApi.getfullFurnituredetails(pcode: pcode),
        builder: (_,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return const Center(child: CircularProgressIndicator());
            }
          else if(snapshot.connectionState==ConnectionState.done)
            {
              if(snapshot.hasData)
                {
                  RecordsetofFurniture dataofproducts=snapshot.data!.recordset.first;
                  return SingleChildScrollView(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Image.network(
                        "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixl"
                            "ib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                        height: 200,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataofproducts.description,
                              style: const TextStyle(
                                  fontSize: 16,
                                  //color: Colors.black54,
                                  color: Color(0xff345372 ),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "${dataofproducts.remarks?.toLowerCase()}",
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black45, letterSpacing: 0.6),
                            ),
                            const SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                text: "Color : ",
                                style: ThemeText.labletextstyle1,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: dataofproducts.colorCd.toLowerCase(),
                                    style: ThemeText.datatextstyle1,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                text: "Size : ",
                                style: ThemeText.labletextstyle1,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                    "${dataofproducts.heightM} m x ${dataofproducts.widthM} m",
                                    style: ThemeText.datatextstyle1,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "BHD   ${dataofproducts.retailprice} /-",
                              style: const TextStyle(
                                fontSize: 28,
                                color: Colors.blueGrey,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "hurry!! only ${dataofproducts.qoh} left",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.deepOrange,
                              ),
                            ),

                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Expanded(
                                    child: AddToCartButton(dataofproducts: dataofproducts, cartbox: box, controller: controller,pcode: pcode,),),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {}, child: const Text("Buy now"))),
                              ],
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ]),
                  );
                }
              else if(snapshot.hasError)
                {
                  return const Center(child: Text("Some issues.. please try again.."));
                }
            }
          return const SizedBox();
        },

      ),
    );
  }
}
