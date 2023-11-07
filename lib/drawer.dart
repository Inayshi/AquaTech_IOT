import 'package:aquatech/AnalyticsPage.dart';
import 'package:aquatech/InformationPage.dart';
import 'package:aquatech/MyTanks.dart';
import 'package:aquatech/PubSubTest.dart';
import 'package:aquatech/SettingsPage.dart';
import 'HomePage.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text(
              'My Tanks',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyTanks()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Records',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => AnalyticsPage()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Information',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => InformationPage()),
              );
            },
          ),
          ListTile(
              title: Text(
                'Connections',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              }),
          ListTile(
              title: Text(
                'Test',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyStatefulWidget()),
                );
              }),
        ],
      ),
    );
  }
}
