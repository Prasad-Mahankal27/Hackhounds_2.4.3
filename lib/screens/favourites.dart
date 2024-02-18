import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: const Center(
          child: Text('Favourite Stations'), // Display the list of favourite stations here
        ),
      ),
    );
  }
}
