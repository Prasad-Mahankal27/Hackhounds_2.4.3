import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      if (_selectedIndex != index) {
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
      } else {
        // If tapped item is already selected, navigate to Home
        if (_selectedIndex != 0) {
          _selectedIndex = 0;
          Navigator.popUntil(context, (route) => route.isFirst);
        }
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBarWidget(),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [ 
                      SizedBox(width: 15,),
                      Card(
                      child: Container(
                        height: 200,
                        width: 350,
                        child: Hero(
                          tag: 'tata_image', // Unique tag for the Hero animation
                          child: Card(
                            color: Color.fromARGB(25, 0, 0, 0),
                            child: Image.network(
                              'https://img-cdn.tnwcdn.com/image?fit=1280%2C720&url=https%3A%2F%2Fcdn0.tnwcdn.com%2Fwp-content%2Fblogs.dir%2F1%2Ffiles%2F2022%2F03%2FEle-AM.jpg&signature=79fb28dde7ff97550b0d63e92ba6e80a',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Card(
                      child: Container(
                        height: 200,
                        width: 350,
                        child: Hero(
                          tag: 'tata_image', // Unique tag for the Hero animation
                          child: Card(
                            color: Color.fromARGB(25, 0, 0, 0),
                            child: Image.network(
                              'https://flex.com/wp-content/uploads/2022/11/commercial-and-personal-ev-charging-stations-0.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Card(
                      child: Container(
                        height: 200,
                        width: 350,
                        child: Hero(
                          tag: 'tata_image', // Unique tag for the Hero animation
                          child: Card(
                            color: Color.fromARGB(25, 0, 0, 0),
                            child: Image.network(
                              'https://nmgprod.s3.amazonaws.com/media/files/40/df/40df720fc40824ccf197eeb0302fc750/cover_image_1645056064.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                  ]  
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  'Amenities Present',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              buildCircularGrid(),
              Text(
                'Nearby Stations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              buildHorizontalGrid(),
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
          onTap: _onItemTapped,
          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }

  Widget buildHorizontalGrid() {
    return Container(
      height: 250, // Height of the horizontal scrollable grid
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: text, // Unique tag for each item
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 110, // Height of the image
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

  Widget buildCircularGrid() {
    return Container(
      height: 120, // Height of the horizontal scrollable grid
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildCircularGridItem(
              "Food Station",
              "https://www.shutterstock.com/image-vector/restaurant-logo-food-station-vector-260nw-1510767863.jpg",
              _onTapCircularItem1),
          buildCircularGridItem(
              "Refreshment Centre",
              "https://i.pinimg.com/736x/d0/0e/f4/d00ef41bab234f8821c0d0210383b049.jpg",
              _onTapCircularItem2),
          buildCircularGridItem(
              "Shopping store",
              "https://img.freepik.com/free-photo/black-friday-elements-assortment_23-2149074075.jpg",
              _onTapCircularItem3),
              buildCircularGridItem(
              "Toys and Gaming",
              "https://plus.unsplash.com/premium_photo-1682142770628-60db2c394b2f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dG95cyUyMGFuZCUyMGdhbWVzfGVufDB8fDB8fHww",
              _onTapCircularItem3),
        ],
      ),
    );
  }

  Widget buildCircularGridItem(
      String text, String imageUrl, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70, // Width and height are equal for a circular image
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
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
                  'https://plus.unsplash.com/premium_photo-1682142770628-60db2c394b2f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dG95cyUyMGFuZCUyMGdhbWVzfGVufDB8fDB8fHww',
              title: 'HP Charging')),
    );
  }

  void _onTapCircularItem1() {
    // Handle circular item 1 tap
  }

  void _onTapCircularItem2() {
    // Handle circular item 2 tap
  }

  void _onTapCircularItem3() {
    // Handle circular item 3 tap
  }
}
