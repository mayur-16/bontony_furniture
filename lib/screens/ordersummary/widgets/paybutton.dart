import 'package:flutter/material.dart';

import '../../../services/payment_service.dart';

class PayButton extends StatefulWidget {
  final String paymentAmount;
  const PayButton({Key? key,required this.paymentAmount}) : super(key: key);

  @override
  State<PayButton> createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  bool _loading=false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: (){
            setState(() {
              _loading=true;
            });
        PaymentService().makePayment(amount: widget.paymentAmount, currency: "INR");
      },
          child: _loading?const CircularProgressIndicator(color: Colors.white,strokeWidth: 1): const Text("Pay")),
    );
  }
}
