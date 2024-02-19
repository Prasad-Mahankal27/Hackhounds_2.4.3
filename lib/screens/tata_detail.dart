import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TataDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;

  TataDetailScreen({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: title,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                                  
                  'Empty Slots Available: 5',
                  style: TextStyle(fontSize: 20,),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Time Required to Charge: 2 hours',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 22),
                const SizedBox(height: 10),
                const Text(
                  'Travel Distance: 4km',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 40),
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
      ),
    );
  }

  void launchGoogleMaps() async {
    const googleMapsUrl = 'https://www.google.com/maps';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}
