import 'package:aquatech/AnalyticsPage.dart';
import 'package:aquatech/InformationPage.dart';
import 'package:aquatech/MyTanks.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF3FC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWithIconAndText(
              icon: Icons.water_sharp,
              text: 'My Tanks',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyTanks()),
                );
              },
            ),
            const SizedBox(height: 30),
            ButtonWithIconAndText(
              icon: Icons.book,
              text: 'Records',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AnalyticsPage()),
                );
              },
            ),
            const SizedBox(height: 30),
            ButtonWithIconAndText(
              icon: Icons.info_outline,
              text: 'Information',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => InformationPage()),
                );
              },
            ),
            const SizedBox(height: 30),
            
          ],
        ),
      ),
    );
  }
}

class ButtonWithIconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  ButtonWithIconAndText({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF0081C9),
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
