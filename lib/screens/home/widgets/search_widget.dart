import 'dart:developer';
import 'package:bontony_furniture/services/api_service.dart';
import 'package:flutter/material.dart';


class MySearchWidget extends StatefulWidget {
  final Function(bool) isSomethingSearched;

  const MySearchWidget({Key? key,required this.isSomethingSearched}) : super(key: key);

  @override
  State<MySearchWidget> createState() => _MySearchWidgetState();
}

class _MySearchWidgetState extends State<MySearchWidget> {
  final FocusNode _focusNode=FocusNode();

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: Theme.of(context).copyWith(colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black54)),
      child: TextField(
        autofocus: false,
        focusNode: _focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          filled: true,
          fillColor: const Color(0xffE5F1E4),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffE5F1E4),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: Color(0xffE5F1E4),
              )),
          prefixIcon: const Icon(Icons.search_outlined),
          focusColor: Colors.white,
          hintText: "Search Items",
          hintStyle: const TextStyle(fontSize: 15, color: Colors.black45),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort_outlined),
          ),
        ),
        onChanged: (changedvalue){
          if(changedvalue.isNotEmpty)
            {
              MyApi.getsearchedFurnitures(searchedText: changedvalue);
              widget.isSomethingSearched(true);
            }else{
            _focusNode.unfocus();
            MyApi.getallFurnitures(offsetval: 0);
            widget.isSomethingSearched(false);
          }
          log(changedvalue,name: "changedvalue");

          /*Future.delayed(const Duration(milliseconds: 500)).then((value){
            log(changedvalue,name: "delayed change");

          });*/

        },
      ),
    );
  }
}

