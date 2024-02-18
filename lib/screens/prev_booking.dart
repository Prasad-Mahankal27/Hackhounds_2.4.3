import 'package:flutter/material.dart';

class PrevBooking extends StatelessWidget {
  const PrevBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Previous booking'),
        ),
        body: GridView.count(
          crossAxisCount: 1, // Set the cross axis count to 1
          children: const [
            GridItem(
              imageUrl:
                  'https://media.istockphoto.com/id/1387159408/photo/ev-charging-station.jpg?s=612x612&w=0&k=20&c=PnTTN8MgkQFbeQcVwtDucDFsn-Dk_R9xER4W3a5cI8I=',
              text: 'TATA Charging',
            ),
            GridItem(
              imageUrl:
                  'https://img.freepik.com/free-photo/electric-car-charging-home-clean-energy-filling-technology_35913-2530.jpg',
              text: 'JIO Charging',
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String imageUrl;
  final String text;

  const GridItem({required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(12, 0, 0, 0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover, // Image will fit the box
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}