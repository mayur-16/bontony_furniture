import 'package:get/get.dart';

class CartItemCounter extends GetxController{
  int numberofitems=0;

  void setnumberofitems(int num){
    numberofitems=num;
    update();
  }

  void incrementnumofitems(){
    numberofitems++;
    update();
  }
}