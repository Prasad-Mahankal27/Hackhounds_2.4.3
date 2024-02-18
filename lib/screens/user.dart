import 'package:flutter/material.dart';
import 'package:hackthon/screens/favourites.dart';
import 'package:hackthon/screens/hp.dart';
import 'package:hackthon/screens/jio.dart';
import 'package:hackthon/screens/nayara.dart';
import 'package:hackthon/screens/prev_booking.dart';
import 'package:hackthon/screens/profile_details_screen.dart';
import 'package:hackthon/screens/tata_detail.dart';
import 'package:hackthon/widgets/searchbar.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavouritesScreen(),
          ), // Navigate to FavouritesScreen
        );
      }
      if (_selectedIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileDetailsScreen(),
          ), // Navigate to profile screen
        );
      }
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PrevBooking(),
          ), // Navigate to profile screen
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Set the theme to dark
      home: Scaffold(
        appBar: AppBar(title: const Text('EV Connect')),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 120),
                  SizedBox(
                    height: 400, // Height of the small card
                    child: Hero(
                      tag: 'tata_image', // Unique tag for the Hero animation
                      child: Card(
                        color: Color.fromARGB(25, 0, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TataDetailScreen(
                                        imageUrl:
                                            'https://media.istockphoto.com/id/1387159408/photo/ev-charging-station.jpg?s=612x612&w=0&k=20&c=PnTTN8MgkQFbeQcVwtDucDFsn-Dk_R9xER4W3a5cI8I=',
                                        title: 'TATA Charging')),
                              );
                            },
                            child: Image.network(
                              'https://techcrunch.com/wp-content/uploads/2022/07/GettyImages-1392356345.jpg?w=730&crop=1',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        buildHorizontalGrid(), // Updated to use horizontal grid
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBarWidget(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online_outlined, color: Colors.white),
              label: 'My Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_alt_outlined, color: Colors.white),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_sharp, color: Colors.white),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 65, 255, 116),
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget buildHorizontalGrid() {
    return Container(
      height: 150, // Height of the horizontal scrollable grid
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildTappableGridItem(
              "TATA Charging",
              "https://media.istockphoto.com/id/1387159408/photo/ev-charging-station.jpg?s=612x612&w=0&k=20&c=PnTTN8MgkQFbeQcVwtDucDFsn-Dk_R9xER4W3a5cI8I=",
              _onTapItem1),
          buildTappableGridItem(
              "JIO Charging",
              "https://img.freepik.com/free-photo/electric-car-charging-home-clean-energy-filling-technology_35913-2530.jpg",
              _onTapItem2),
          buildTappableGridItem(
              "NAYARA Charging",
              "https://img.freepik.com/premium-vector/electric-car-charging-charger-station-cityscape-background_136277-447.jpg",
              _onTapItem3),
          buildTappableGridItem(
              "HP Charging",
              "https://images.cnbctv18.com/wp-content/uploads/2021/04/evcharging1-1019x573.jpg?im=FitAndFill,width=1200,height=900",
              _onTapItem4),
        ],
      ),
    );
  }

  Widget buildTappableGridItem(
      String text, String imageUrl, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: text, // Unique tag for each item
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 100, // Height of the image
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapItem1() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TataDetailScreen(
          imageUrl:
              'https://media.istockphoto.com/id/1387159408/photo/ev-charging-station.jpg?s=612x612&w=0&k=20&c=PnTTN8MgkQFbeQcVwtDucDFsn-Dk_R9xER4W3a5cI8I=',
          title: 'TATA Charging',
        ),
      ),
    );
  }

  void _onTapItem2() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JioDetailScreen(
          imageUrl:
              'https://img.freepik.com/free-photo/electric-car-charging-home-clean-energy-filling-technology_35913-2530.jpg',
          title: 'JIO Charging',
        ),
      ),
    );
  }

  void _onTapItem3() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NayaraDetailScreen(
          imageUrl:
              'https://img.freepik.com/premium-vector/electric-car-charging-charger-station-cityscape-background_136277-447.jpg',
          title: 'NAYARA Charging',
        ),
      ),
    );
  }

  void _onTapItem4() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HPPump(
              imageUrl:
                  'https://images.cnbctv18.com/wp-content/uploads/2021/04/evcharging1-1019x573.jpg?im=FitAndFill,width=1200,height=900',
              title: 'HP Charging')),
    );
  }
}
