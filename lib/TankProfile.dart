import 'package:aquatech/WaterTempGauge.dart';
import 'package:aquatech/drawer.dart';
import 'package:aquatech/gauge.dart';
import 'package:aquatech/gaugebasic.dart';
import 'package:flutter/material.dart';

class TankProfile extends StatefulWidget {
  const TankProfile({super.key});

  @override
  _TankProfileState createState() => _TankProfileState();
}

class _TankProfileState extends State<TankProfile> {
  bool showGaugeBasic = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 100,
              color: Color(0xFF0081C9),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tank 1 ',
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),
                        DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF5BC0F8) // Set the desired color for the circle
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove_red_eye, color: Colors.black), // Set the desired color for the icon
                              onPressed: () {
                                setState(() {
                                  showGaugeBasic = !showGaugeBasic;
                                });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Switched Views')),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedPillButton(
                            text: 'Change Water',
                            backgroundColor: const Color(0xFF5BC0F8),
                            textColor: Colors.black,
                          ),
                          SizedBox(width: 20),
                          RoundedPillButton(
                            text: 'Load Balancer',
                            backgroundColor: const Color(0xFF5BC0F8),
                            textColor: Colors.black,
                          ),
                          SizedBox(width: 20),
                      
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFEDF3FC),
                child: showGaugeBasic ? GaugeBasic() : Gauge(),
              ),
            ),
          ],
        ),
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
