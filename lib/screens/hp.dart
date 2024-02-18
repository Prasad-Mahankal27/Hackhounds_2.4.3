import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HPPump extends StatelessWidget {
  final String imageUrl;
  final String title;

  HPPump({required this.imageUrl, required this.title});

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
                'Empty Slots Available: 3',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                'Time Required to Charge: 1.5 hours',
                style: TextStyle(fontSize: 20),
              ),

              const Text(
                'Travel Time : 18 min',
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
    const googleMapsUrl = 'https://www.google.com/maps/place/Ather+Charging+Station/@18.5887586,73.6823056,12z/data=!4m10!1m2!2m1!1sather+ev+charging+stations+pune!3m6!1s0x3bc2b93ccfaf1f4d:0x796b1fa95f83650e!8m2!3d18.5887678!4d73.7825231!15sCh9hdGhlciBldiBjaGFyZ2luZyBzdGF0aW9ucyBwdW5lkgEhZWxlY3RyaWNfdmVoaWNsZV9jaGFyZ2luZ19zdGF0aW9u4AEA!16s%2Fg%2F11rmn9knbb?entry=ttu';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}