import 'package:flutter/material.dart';
import 'package:hackthon/screens/edit_profile.dart';

class ProfileDetailsScreen extends StatefulWidget {
  @override
  _ProfileDetailsScreenState createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  String _userName = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: Container(
        color: Colors.grey[900], // Dark background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const CircleAvatar(
             // backgroundImage: AssetImage('assets/profile_image.png'), // Your profile image asset
             child: Icon(Icons.person_2, size: 50,),
              radius: 40.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              _userName,
              style: const TextStyle(
                color:  Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              _email,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 32.0),
            ListTile(
              title: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(Icons.edit, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen(userName: _userName, email: _email)),
                ).then((updatedData) {
                  if (updatedData != null) {
                    setState(() {
                      _userName = updatedData['userName'];
                      _email = updatedData['email'];
                    });
                  }
                });
              },
            ),
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(Icons.settings, color: Colors.white),
              onTap: () {
                // Add logic to handle Settings
              },
            ),
            ListTile(
              title:const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(Icons.logout, color: Colors.white),
              onTap: () {
                // Add logic to handle Logout
              },
            ),
          ],
        ),
      ),
    );
  }
}