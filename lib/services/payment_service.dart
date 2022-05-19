import 'dart:convert';
import 'dart:developer';
import 'package:bontony_furniture/main.dart';
import 'package:bontony_furniture/screens/orderconfirmed/orderconfirmedpage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../bloc/cartitemcounter.dart';

class PaymentService extends GetxController{

  Map<String, dynamic>? paymentIntentData;

  ///initiate Get controller
  final CartItemCounter controller=Get.find();

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              applePay: true,
              googlePay: true,
              testEnv: true,
              merchantCountryCode: 'IN',
              merchantDisplayName: 'Prospects',
              customerId: paymentIntentData!['customer'],
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
            ));
         displayPaymentSheet();
      }
    } catch (e, s) {
      log("$e ,$s",name: "exception");
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      ///show snackbar for payment completion
      Get.snackbar('Payment', 'Payment Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2));

      ///delete items from cart box
      cartbox.clear();

      ///set the number of cart items for displaying in badge
      controller.setnumberofitems(0);


      ///delete previous route
      Get.off(()=>const OrderConfirmedPage());

    } on Exception catch (e) {
      if (e is StripeException) {
        log("${e.error.localizedMessage}",name: "Error from Stripe");
      } else {
        log("$e ",name: "Unforeseen error");
      }
    } catch (e) {
      log(e.toString(),name: "exception");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer sk_test_51KfjKqSBundL6etQxodAFIwNANvf0spIqF3ZvtbnUiEUusQ1QCzCCfXC97Tb3NgoLj0OYJ3GRJdJaidnvoyFmlvg00tTlpeEiu',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      log(err.toString(),name: "err charging user");
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}