import 'package:flutter/material.dart';

class ItemIncrementDecrement extends StatefulWidget {
  final Function(int) onQuantitychanged;
  final int quantity;
  const ItemIncrementDecrement({Key? key,required this.onQuantitychanged,required this.quantity}) : super(key: key);

  @override
  State<ItemIncrementDecrement> createState() => _ItemIncrementDecrementState();
}

class _ItemIncrementDecrementState extends State<ItemIncrementDecrement> {
  int quantity=1;

  @override
  void initState() {
    super.initState();
    quantity=widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      // padding: EdgeInsets.all(3),
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffF7C59F)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: IconButton(
                padding: EdgeInsets.zero,
                splashColor: Colors.grey[400],
                onPressed: () {
                  if (quantity != 1) {
                    setState(() {
                      quantity--;
                    });
                    widget.onQuantitychanged(quantity);
                  }
                },
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 16,
                )),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                '$quantity',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black, fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
                padding: EdgeInsets.zero,
                splashColor: Colors.grey[400],
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                  widget.onQuantitychanged(quantity);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                )),
          ),
        ],
      ),
    );
  }
}
