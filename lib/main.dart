import 'package:bontony_furniture/models/hivefurniture.dart';
import 'package:bontony_furniture/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

import 'models/hiveaddress.dart';

late Box<HiveFurniture> cartbox;
late Box<HiveAddress> addressbox;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey='pk_test_51KfjKqSBundL6etQpxnL4jqKLdRnJNf15UIMrIUKXSPSRdbU2SwnHT09mlM3yGnvk3MiUWWZ0JfmUswfjlCN1KX900fR5Qavem';
  await Hive.initFlutter();
  Hive.registerAdapter(HiveFurnitureAdapter());
  Hive.registerAdapter(HiveAddressAdapter());
  cartbox=await Hive.openBox<HiveFurniture>("MycartBox");
  addressbox=await Hive.openBox<HiveAddress>("addressBox");
  runApp(const MyApp());
 /* SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge).then(
    (_) => runApp(const MyApp())
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(cartbox: cartbox,addressbox: addressbox,),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF7F9F9),
        textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
        appBarTheme:  AppBarTheme(
          backgroundColor: const Color(0xffFBFCFC),
          titleTextStyle: GoogleFonts.redressed(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),
          iconTheme: const IconThemeData(color: Colors.black54),
          actionsIconTheme: const IconThemeData(color: Colors.black54),
          centerTitle: true,
          elevation: 0,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xff8F410D)),
            )),

      ),
    );
  }
}

