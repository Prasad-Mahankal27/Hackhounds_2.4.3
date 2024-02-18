import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPage extends StatefulWidget {
  const RazorPayPage({super.key});

  @override
  State<RazorPayPage> createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async{
    amount = amount *100;
    var options = {
      'key': 'rzp_test_DNzKjlE1WlDqt0',
      'amount': amount,
      'name': 'Aditya',
      'prefill': {'contact' : '8654637289', 'email': 'adc@gmail.com'},
      'external': {
        'wallets':['paytm']
      }
    };

    try{
      _razorpay.open(options);
    }
    catch(e){
      debugPrint('Error : e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "Payment successfull"+response.paymentId!,toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "Payment Fail"+response.message!,toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet"+response.walletName!,toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 300),
            Padding(padding: EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    )
                  ),
                  errorStyle: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 15
                  )
                ),
                controller: amtController,
                validator:(value) {
                  if(value==null || value.isEmpty)
                    {
                      return 'Please enter amount to be paid';
                    }
                  return null;
                },
              ),
            ),
            SizedBox(height:20 ,),
            ElevatedButton(
                onPressed: (){
                  if(amtController.text.toString().isNotEmpty){
                    setState(() {
                      int amount = int.parse(amtController.text.toString());
                      openCheckout(amount);
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Make Payment'),

                ),
            style: ElevatedButton.styleFrom(primary: Colors.lightGreenAccent),)

          ],

              )
      ),
    );
  }
}
