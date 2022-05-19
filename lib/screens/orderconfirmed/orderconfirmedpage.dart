
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';


class OrderConfirmedPage extends StatefulWidget {
  const OrderConfirmedPage({Key? key}) : super(key: key);

  @override
  State<OrderConfirmedPage> createState() => _OrderConfirmedPageState();
}

class _OrderConfirmedPageState extends State<OrderConfirmedPage> {
final ConfettiController _confettiController=ConfettiController(duration: const Duration(seconds: 4));


@override
  void initState() {
super.initState();
_confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/balloon.png",height: 80,width: 80,),
              const SizedBox(height: 100),
              const Text("Your order is Complete!",style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 22),),
              const Text("you will be receiving confirmation email with order details.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black38),),
              const SizedBox(height: 80),
              OutlinedButton.icon(onPressed: (){
                Get.close(3);
              }, label: const Text("Explore more products"),
              icon: const Icon(Icons.explore_outlined),)
            ],
          ),
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                  confettiController: _confettiController,
                numberOfParticles: 15,
                blastDirectionality: BlastDirectionality.explosive,
              ),
            )
        ]
        ),
      ),
    );
  }
}
