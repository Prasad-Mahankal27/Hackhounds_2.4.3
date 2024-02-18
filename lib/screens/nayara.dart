import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NayaraDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;

  NayaraDetailScreen({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: title,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Empty Slots Available: 2',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                'Time Required to Charge: 3 hours',
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 20),
              const Text(
                'Travel Time : 24 min ',
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(90, 60),
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle elevated booking button tap
                      // Add your booking logic here
                    },
                    child: Text('Book Now'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(90, 60),
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.directions),
                    onPressed: () {
                      launchGoogleMaps();
                    },
                    iconSize: 32,
                    color: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void launchGoogleMaps() async {
    const googleMapsUrl = 'https://www.google.com/maps/place/Electric+Vehicle+Charging+Station/@18.5807452,73.7297456,12z/data=!4m10!1m2!2m1!1snayara+ev+charging+stations+pune!3m6!1s0x3bc2b9d7fef9d095:0x151e2c2fe6820263!8m2!3d18.5807445!4d73.8156886!15sCiBuYXlhcmEgZXYgY2hhcmdpbmcgc3RhdGlvbnMgcHVuZSIDiAEBkgEhZWxlY3RyaWNfdmVoaWNsZV9jaGFyZ2luZ19zdGF0aW9u4AEA!16s%2Fg%2F11t9jg6c7v?entry=ttu';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}