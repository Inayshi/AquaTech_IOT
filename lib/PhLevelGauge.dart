import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PhLevelGauge extends StatelessWidget {
  final double value;

  PhLevelGauge({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column( // Wrap the gauge in a Column to include a title
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'pH Level',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SfLinearGauge(
            ranges: [
              LinearGaugeRange(
                  startValue: 0,
                  endValue: 1,
                  color: Colors.red
              ),
              LinearGaugeRange(
                startValue: 1,
                endValue: 2,
                color: Colors.deepOrange,
              ),
              LinearGaugeRange(
                startValue: 2,
                endValue: 3,
                color: Colors.orange,
              ),
              LinearGaugeRange(
                startValue: 3,
                endValue: 4,
                color: Colors.orangeAccent,
              ),
              LinearGaugeRange(
                startValue: 4,
                endValue: 5,
                color: Colors.yellow,
              ),
              LinearGaugeRange(
                startValue: 5,
                endValue: 6,
                color: Colors.yellowAccent,
              ),
              LinearGaugeRange(
                startValue: 6,
                endValue: 7,
                color: Colors.limeAccent,
              ),
              LinearGaugeRange(
                startValue: 7,
                endValue: 8,
                color: Colors.lime,
              ),
              LinearGaugeRange(
                startValue: 8,
                endValue: 9,
                color: Colors.lightGreen,
              ),
              LinearGaugeRange(
                startValue: 9,
                endValue: 10,
                color: Colors.green,
              ),
              LinearGaugeRange(
                startValue: 10,
                endValue: 11,
                color: Colors.blueGrey,
              ),
              LinearGaugeRange(
                startValue: 11,
                endValue: 12,
                color: Colors.blueAccent,
              ),
              LinearGaugeRange(
                startValue: 12,
                endValue: 13,
                color: Colors.blue,
              ),
              LinearGaugeRange(
                startValue: 13,
                endValue: 14,
                color: Colors.blueAccent,
              ),
            ],
            minimum: 0.0,
            maximum: 14.0,
            interval: 1.0,
            orientation: LinearGaugeOrientation.horizontal,
            axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
            axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.white,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey,
            ),
            markerPointers: <LinearMarkerPointer>[
              LinearShapePointer(
                value: value,
                shapeType: LinearShapePointerType.invertedTriangle,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
    );
  }
}