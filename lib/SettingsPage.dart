import 'package:aquatech/TankProfile.dart';
import 'package:aquatech/drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          Container(
            color: Color(0xFF0081C9), // Top part color
            height: MediaQuery.of(context).size.height * 0.2, // 30% of screen height
            child: Center(
              child: Text(
                'Connections',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
