import 'package:flutter/material.dart';
import 'package:razorpay/razorpay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Razorpay Payment ',
      home: const RazorPayPage(),
    );
  }
}
