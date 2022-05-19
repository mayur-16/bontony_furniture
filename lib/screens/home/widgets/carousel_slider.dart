import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../models/home_banner.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({Key? key}) : super(key: key);

  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int _currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: bannerItems.length,
            itemBuilder: (context, index, pageViewIndex) => Container(
              //margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.srcOver),
                        image: NetworkImage(bannerItems[index].imagelink),
                        fit: BoxFit.fill),
                  ),
                  child: Center(
                      child: Text(
                    bannerItems[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14),
                  )),
                ),
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 0.8,
                aspectRatio: 2.2,
                //viewportFraction: 1,
                //aspectRatio: 16/9,
                enlargeCenterPage: true,
                //enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentItem = index;
                  });
                })),
        const SizedBox(height: 10),
        PageViewDotIndicator(
          currentItem: _currentItem,
          count: bannerItems.length,
          unselectedColor: Colors.grey,
          selectedColor: Colors.black,
          unselectedSize: const Size(7, 7),
          size: const Size(10, 10),
        ),
      ],
    );
  }
}
