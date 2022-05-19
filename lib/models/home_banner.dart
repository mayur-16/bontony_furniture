import 'package:flutter/material.dart';

class BannerItem{
  final String title,imagelink;
  BannerItem({required this.title,required this.imagelink});
}

List<BannerItem> bannerItems=[
  BannerItem(title: "Premium Quality\nWooden Teapoys", imagelink: "https://images.unsplash.com/photo-1616464916356-3a777b2b60b1?ixlib=rb-1.2.1&"
      "ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
  BannerItem(title: "King Size\nCusion chairs", imagelink: "https://images.unsplash.com/photo-1550226891-ef816aed4a98?ix"
      "lib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  BannerItem(title: "Customizable\nTv stands", imagelink: "https://images.unsplash.com/photo-1616627781431-23b776aad6b2?ixlib=rb-1.2.1&ixi"
      "d=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
  BannerItem(title: "Durable\nSofa sets", imagelink: "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixl"
      "ib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
];
