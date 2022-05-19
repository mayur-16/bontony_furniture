import 'dart:developer';
import 'package:bontony_furniture/bloc/cartitemcounter.dart';
import 'package:bontony_furniture/bloc/furniturebloc.dart';
import 'package:bontony_furniture/models/hiveaddress.dart';
import 'package:bontony_furniture/models/hivefurniture.dart';
import 'package:bontony_furniture/screens/home/widgets/appbar.dart';
import 'package:bontony_furniture/screens/home/widgets/carousel_slider.dart';
import 'package:bontony_furniture/screens/home/widgets/search_widget.dart';
import 'package:bontony_furniture/screens/productdetails/productdetails_page.dart';
import 'package:bontony_furniture/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../models/minimalfurniture.dart';

class HomePage extends StatefulWidget {
  final Box<HiveFurniture> cartbox;
  final Box<HiveAddress> addressbox;

  const HomePage({Key? key, required this.cartbox,required this.addressbox}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final customScrollController = ScrollController();

  ///initiate Get controller
  final CartItemCounter controller = Get.put(CartItemCounter());

  List<String> imagelinks = [
    'https://images.unsplash.com/photo-1538688525198-9b88f6f53126?ixlib=rb-1.2.1'
        '&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
  ];

  List<RecordsetofminimalProduct> datalist = []; // list of products
  bool showBanners = true, showResultLength = false, searchedsomething = false;

  @override
  void initState() {
    super.initState();
    int incrementedoffsetvalue = 1;

    customScrollController.addListener(() {
      if (customScrollController.position.maxScrollExtent ==
          customScrollController.offset) {
        if (!searchedsomething) //load data dynamically in small amount only if nothing is searched.. otherwise load completely!
        {
          getallFurnitures(offsetvalue: incrementedoffsetvalue);
          incrementedoffsetvalue++;
        }
      }
    });
    getallFurnitures(offsetvalue: 0);

    ///set the number of cart items for displaying in badge
    controller.setnumberofitems(widget.cartbox.values.length);
  }

  @override
  void dispose() {
    furnitureBloc.streamControllerofProductItems.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("built widget");
    return Scaffold(
      appBar: HomePageAppBar().getAppBar(
          context: context, cartbox: widget.cartbox, cartItemCounter: controller),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            MySearchWidget(
              isSomethingSearched: (bool isSearched) {
                showBanners = !isSearched;
                showResultLength = isSearched;
                searchedsomething = isSearched;
              },
            ),
            StreamBuilder<MinimalProduct>(
                stream: furnitureBloc.streamControllerofProductItems.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    log("connection waiting");
                    return const SizedBox(
                        height: 150,
                        child: Center(child: CircularProgressIndicator()));
                  } else if (snapshot.connectionState ==
                          ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.done) {
                    log("connection done");
                    if (snapshot.hasError) {
                      log(snapshot.error.toString(), name: "error");
                      return const Center(
                        child: Text('some issues please try again'),
                      );
                    } else if (snapshot.hasData) {
                      if (searchedsomething) {
                        datalist = snapshot.data!.recordset;
                      } else {
                        datalist.addAll(snapshot.data!.recordset);
                      }

                      if (datalist.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(
                              child: Text("No relavent Furniture...right now")),
                        );
                      } else {
                        int datalength =
                            datalist.length; //get length of fetched data
                        log("${datalist.length}", name: "data length");
                        return Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomScrollView(
                              controller: customScrollController,
                              physics: const BouncingScrollPhysics(),
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              slivers: [
                                SliverList(
                                  delegate: SliverChildListDelegate([
                                    showBanners
                                        ? const MyCarouselSlider()
                                        : const SizedBox(),
                                    showResultLength
                                        ? Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              "Found ${datalist.length} Results",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black38),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ]),
                                ),
                                SliverGrid.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 5.0,
                                  childAspectRatio: 0.7,
                                  children: List.generate(datalength, (index) {
                                    return Card(
                                      color: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: Color(0xffE5E7E9))),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => ProductDetails(
                                                pcode: datalist[index].pcode,
                                                box: widget.cartbox,
                                              ));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.network(
                                                "https://freepngimg.com/thumb/armchair/3-armchair-png-image-thumb.png",
                                                height: 100,
                                                width: 80,
                                              ),
                                              Text(
                                                datalist[index].description,
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                                style: GoogleFonts.lato(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black38),
                                              ),
                                              /*Text(
                                              datalist[index].remarks == null
                                                  ? "--"
                                                  : datalist[index]
                                                  .remarks!
                                                  .toLowerCase(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.lato(
                                                  fontSize: 11,
                                                  color:
                                                  Colors.grey.shade400),
                                            ),*/
                                              Text(
                                                "\nBHD ${datalist[index].retailprice}/-",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.kanit(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.green.shade800),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                SliverToBoxAdapter(
                                  child: searchedsomething
                                      ? const SizedBox(height: 100)
                                      : const SizedBox(
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          height: 200,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    } else {
                      log("lets see what happens");
                      return const SizedBox();
                    }
                  }

                  return const SizedBox();
                }),
          ],
        ),
      ),
    );
  }

  void getallFurnitures({required int offsetvalue}) async {
    MyApi.getallFurnitures(offsetval: offsetvalue);
  }
}
