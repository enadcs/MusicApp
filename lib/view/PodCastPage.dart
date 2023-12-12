import 'package:flutter/material.dart';

class PodCastsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark gray background

      body: Center(
        child: Text(
          'PodCast',
          style: TextStyle(
            color: Colors.white, // White text color
            fontSize: 14.0, // Font size 14
          ),
        ),
      ),
    );
  }
}
