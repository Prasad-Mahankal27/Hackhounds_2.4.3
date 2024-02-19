import 'dart:async';

import 'package:flutter/material.dart';
import 'package:evago/screens/user.dart';


class Review extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Feedback App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black87,
      ),
      home: FeedbackPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double _rating = 0;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _suggestionController = TextEditingController();

  bool _isDarkTheme = true;

  final List<String> _feedback = ['Terrible', 'Bad', 'Average', 'Good', 'Excellent'];

  @override
  Widget build(BuildContext ctx) {
    return Theme(
       data :ThemeData.dark() ,
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Feedback', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.black,
            ),
            body: Container(
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                gradient: _isDarkTheme ? _linearGradientDark() : _linearGradientLight(),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rate Our App', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: _isDarkTheme ? Colors.white : Colors.black)),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          EmojiRating(
                            onChanged: (value) {
                              setState(() {
                                _rating = value;
                              });
                            },
                            value: _rating,
                          ),
                          SizedBox(height: 8),
                          Text(_rating > 0 && _rating <= 5 ? _feedback[(_rating - 1).toInt()] : 'Tap an emoji to rate', style: TextStyle(fontSize: 20, color: _isDarkTheme ? Colors.white : Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(controller: _textController, decoration: InputDecoration(labelText: 'Your Feedback', border: OutlineInputBorder()), maxLines: 5),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(controller: _suggestionController, decoration: InputDecoration(labelText: 'Your Suggestions', border: OutlineInputBorder()), maxLines: 5),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text('Submit Feedback'),
                      onPressed: () => _submitFeedback(ctx),
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF44d43b), foregroundColor: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _submitFeedback(BuildContext ctx) {
    print('Rating: $_rating');
    print('Feedback: ${_textController.text}');
    print('Suggestions: ${_suggestionController.text}');

    final snackBar = SnackBar(
      content: Row(
        children: [
          Text('Thank you for your feedback'),
          SizedBox(width: 8),
          Text('🙏'),
        ],
      ),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
    Timer(Duration(seconds: 2), () {Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPage()),
    ); });
    
  }

  Gradient _linearGradientDark() {
    return LinearGradient(
      colors: [Color(0xFF13294b), Color(0xFF1a7ca8)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  Gradient _linearGradientLight() {
    return LinearGradient(
      colors: [Colors.white, Color(0xFFF3F3F3)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}

class EmojiRating extends StatelessWidget {
  final double value;
  final Function(double) onChanged;

  const EmojiRating({Key? key, required this.value, required this.onChanged}) : super(key: key);

  Widget buildEmoji(int index) {
    switch (index.toInt()) {
      case 1:
        return Text('😔', style: TextStyle(fontSize: 40));
      case 2:
        return Text('😕', style: TextStyle(fontSize: 40));
      case 3:
        return Text('🙂', style: TextStyle(fontSize: 40));
      case 4:
        return Text('😄', style: TextStyle(fontSize: 40));
      case 5:
        return Text('😁', style: TextStyle(fontSize: 40));
      default:
        return Text('');
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
            (index) => IconButton(
          icon: buildEmoji(index + 1),
          onPressed: () {
            onChanged(index.toDouble() + 1);
          },
        ),
      ),
    );
  }
}