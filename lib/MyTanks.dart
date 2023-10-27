import 'package:aquatech/TankProfile.dart';
import 'package:aquatech/drawer.dart';
import 'package:flutter/material.dart';

class MyTanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tanks'),
      ),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          Container(
            color: Color(0xFF0081C9), // Top part color
            height: MediaQuery.of(context).size.height * 0.2, // 30% of screen height
            child: Center(
              child: Text(
                'My Tanks',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 2, // Replace with the actual number of tanks
              separatorBuilder: (context, index) => Divider(), // Add a separator between items
              itemBuilder: (context, index) {
                // Replace with tank data
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => TankProfile()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'Tank ${index + 1}',
                      style: TextStyle(
                        fontSize: 30, // Set the desired font size
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
