import 'dart:async';
import 'package:flutter/material.dart';
import 'package:evago/prasad/dash.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

@override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_pin, size: 100, color: Colors.deepOrangeAccent,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("EV", style: TextStyle(color: Colors.greenAccent, fontSize: 70, fontWeight: FontWeight.bold),),
                Text("ago", style: TextStyle(color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
        ),
    );
  }
}