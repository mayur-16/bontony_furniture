// To parse this JSON data, do
//
//     final furniture = furnitureFromJson(jsonString);

import 'dart:convert';

Furniture furnitureFromJson(String str) => Furniture.fromJson(json.decode(str));

String furnitureToJson(Furniture data) => json.encode(data.toJson());

class Furniture {
  Furniture({
    required this.recordset,
  });

  List<RecordsetofFurniture> recordset;

  factory Furniture.fromJson(Map<String, dynamic> json) => Furniture(
    recordset: List<RecordsetofFurniture>.from(json["recordset"].map((x) => RecordsetofFurniture.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordset": List<dynamic>.from(recordset.map((x) => x.toJson())),
  };
}


class RecordsetofFurniture {
  RecordsetofFurniture({
    required this.pcode,
    required this.description,
    required this.categoryId,
    required this.categoryName,
    required this.subcategoryId,
    required this.subcategoryName,
    required this.retailprice,
    required this.discount,
    required this.qoh,
    required this.heightM,
    required this.widthM,
    required this.remarks,
    required this.size,
    required this.colorCd,
  });

  String pcode;
  String description;
  String categoryId;
  String categoryName;
  String subcategoryId;
  String subcategoryName;
  double retailprice;
  int? discount;
  int? qoh;
  String? heightM;
  String? widthM;
  String? remarks;
  String? size;
  String colorCd;

  factory RecordsetofFurniture.fromJson(Map<String, dynamic> json) => RecordsetofFurniture(
    pcode: json["PCODE"],
    description: json["DESCRIPTION"],
    categoryId: json["CATEGORY_ID"],
    categoryName: json["CATEGORY_NAME"],
    subcategoryId: json["SUBCATEGORY_ID"],
    subcategoryName: json["SUBCATEGORY_NAME"],
    retailprice: json["RETAILPRICE"].roundToDouble(),
    discount: json["DISCOUNT"],
    qoh: json["QOH"],
    heightM: json["HEIGHT_M"].toString(),
    widthM: json["WIDTH_M"].toString(),
    remarks: json["REMARKS"],
    size: json["SIZE"],
    colorCd: json["COLOR_CD"],
  );

  Map<String, dynamic> toJson() => {
    "PCODE": pcode,
    "DESCRIPTION": description,
    "CATEGORY_ID": categoryId,
    "CATEGORY_NAME": categoryName,
    "SUBCATEGORY_ID": subcategoryId,
    "SUBCATEGORY_NAME": subcategoryName,
    "RETAILPRICE": retailprice,
    "DISCOUNT": discount,
    "QOH": qoh,
    "HEIGHT_M": heightM,
    "WIDTH_M": widthM,
    "REMARKS": remarks,
    "SIZE": size,
    "COLOR_CD": colorCd,
  };
}

