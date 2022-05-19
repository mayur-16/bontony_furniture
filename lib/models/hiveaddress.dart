import 'package:hive/hive.dart';

part 'hiveaddress.g.dart';

@HiveType(typeId: 1)
class HiveAddress extends HiveObject{
  HiveAddress({required this.contactname,required this.contactphno,required this.addname,required this.addarea,
    required this.addblockno,required this.addstreetno,required this.addbuildingno,required this.addflatno});

  @HiveField(0)
  String contactname;
  @HiveField(1)
  String contactphno;
  @HiveField(2)
  String addname;
  @HiveField(3)
  String addarea;
  @HiveField(4)
  String addblockno;
  @HiveField(5)
  String addstreetno;
  @HiveField(6)
  String addbuildingno;
  @HiveField(7)
  String addflatno;
}
