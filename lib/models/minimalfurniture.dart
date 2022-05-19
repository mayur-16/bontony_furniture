// To parse this JSON data, do
//
//     final minimalProduct = minimalProductFromJson(jsonString);

import 'dart:convert';

MinimalProduct minimalProductFromJson(String str) => MinimalProduct.fromJson(json.decode(str));

String minimalProductToJson(MinimalProduct data) => json.encode(data.toJson());

class MinimalProduct {
  MinimalProduct({
    required this.recordset,
  });

  List<RecordsetofminimalProduct> recordset;

  factory MinimalProduct.fromJson(Map<String, dynamic> json) => MinimalProduct(
    recordset: List<RecordsetofminimalProduct>.from(json["recordset"].map((x) => RecordsetofminimalProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordset": List<dynamic>.from(recordset.map((x) => x.toJson())),
  };
}


class RecordsetofminimalProduct {
  RecordsetofminimalProduct({
    required this.pcode,
    required this.description,
    required this.retailprice,
  });

  String pcode;
  String description;
  double retailprice;

  factory RecordsetofminimalProduct.fromJson(Map<String, dynamic> json) => RecordsetofminimalProduct(
    pcode: json["PCODE"],
    description: json["DESCRIPTION"],
    retailprice: json["RETAILPRICE"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "PCODE": pcode,
    "DESCRIPTION": description,
    "RETAILPRICE": retailprice,
  };
}
