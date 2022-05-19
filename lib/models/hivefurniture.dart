import 'package:hive/hive.dart';

part 'hivefurniture.g.dart';

@HiveType(typeId: 0)
class HiveFurniture extends HiveObject{
  HiveFurniture({required this.pcode,required this.description,required this.remarks,required this.retailprice,required this.quantity});

  @HiveField(0)
  String pcode;
  @HiveField(1)
  String description;
  @HiveField(2)
  double retailprice;
  @HiveField(3)
  String? remarks;
  @HiveField(4)
  int quantity;
}
