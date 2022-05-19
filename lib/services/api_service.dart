import 'package:bontony_furniture/bloc/furniturebloc.dart';
import 'package:bontony_furniture/models/furniture.dart';
import 'package:http/http.dart' as http;

import '../models/minimalfurniture.dart';

abstract class MyApi {
  static void getallFurnitures(
      {required int offsetval}) async {
    //offset value is for fetching fixed amount of data. for ex: 10 rows
    String urL = "http://15.185.46.105:5002/api/bontony/getallfurnitures/$offsetval";
    http.Response response = await http.get(Uri.parse(urL));
    MinimalProduct furniture = minimalProductFromJson(response.body);
    furnitureBloc.streamControllerofProductItems.sink.add(furniture);
  }

  static void getsearchedFurnitures(
      {required String searchedText}) async {
    String urL = "http://15.185.46.105:5002/api/bontony/getallsearchedfurnitures/$searchedText";
    http.Response response = await http.get(Uri.parse(urL));
    MinimalProduct furniture = minimalProductFromJson(response.body);
    furnitureBloc.streamControllerofProductItems.sink.add(furniture);
  }



  static Future<Furniture> getfullFurnituredetails(
      {required String pcode}) async {
    http.Response response = await http.get(Uri.parse(
        "http://15.185.46.105:5002/api/bontony/getfullfurnituredetails/$pcode"));
    Furniture furniture = furnitureFromJson(response.body);
    return furniture;
  }
}
