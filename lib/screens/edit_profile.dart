import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String userName;
  final String email;

  const EditProfileScreen(
      {Key? key, required this.userName, required this.email})
      : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _userNameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController(text: widget.userName);
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(labelText: 'User Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'userName': _userNameController.text,
                  'email': _emailController.text,
                });
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
