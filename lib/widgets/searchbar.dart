import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),),
        ),
      ),
    );
  }
}