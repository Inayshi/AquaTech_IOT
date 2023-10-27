import 'package:aquatech/WaterTempGauge.dart';
import 'package:aquatech/drawer.dart';
import 'package:aquatech/gauge.dart';
import 'package:aquatech/gaugebasic.dart';
import 'package:flutter/material.dart';


class TankProfile extends StatelessWidget {
  const TankProfile({super.key});

  get floatingActionButton => null;
  get showGaugeBasic => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2, // 40% of screen height
            color: Color(0xFF0081C9),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tank 1',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedPillButton(
                        text: 'Change Water',
                        backgroundColor: Color(0xFF5BC0F8),
                        textColor: Colors.black,
                      ),
                      SizedBox(width: 20),
                      RoundedPillButton(
                        text: 'Dispense pH Balancer',
                        backgroundColor: Color(0xFF5BC0F8),
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFEDF3FC),
              width: 500,
              height: 1500,
              child: GaugeBasic(),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerWithIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  ContainerWithIcon(this.icon, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFEDF3FC),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.3), // Black with opacity 0.5
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 50,
      ),
    );
  }
}

class RoundedPillButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  RoundedPillButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.2), // Black with opacity 0.5
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
