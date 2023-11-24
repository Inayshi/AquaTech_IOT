import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PhLevelGaugeBasic extends StatelessWidget {
  final double value;

  PhLevelGaugeBasic({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        // Wrap the gauge in a Column to include a title
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'pH Level',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SfLinearGauge(
            ranges: const [
              LinearGaugeRange(
                  startValue: 0,
                  endValue: 1,
                  color: Color.fromARGB(255, 160, 195, 255)),
              LinearGaugeRange(
                startValue: 1,
                endValue: 2,
                color: Colors.lightBlueAccent,
              ),
              LinearGaugeRange(
                startValue: 2,
                endValue: 3,
                color: Colors.blue,
              ),
              LinearGaugeRange(
                startValue: 3,
                endValue: 4,
                color: Colors.green,
              ),
              LinearGaugeRange(
                startValue: 4,
                endValue: 5,
                color: Colors.lightGreen,
              ),
              LinearGaugeRange(
                startValue: 5,
                endValue: 6,
                color: Color.fromARGB(255, 75, 107, 37),
              ),
              LinearGaugeRange(
                startValue: 6,
                endValue: 7,
                color: Color.fromARGB(255, 118, 184, 43),
              ),
              LinearGaugeRange(
                startValue: 7,
                endValue: 8,
                color: Color.fromARGB(255, 243, 232, 131),
              ),
              LinearGaugeRange(
                startValue: 8,
                endValue: 9,
                color: Colors.yellow,
              ),
              LinearGaugeRange(
                startValue: 9,
                endValue: 10,
                color: Color.fromARGB(255, 212, 212, 0),
              ),
              LinearGaugeRange(
                startValue: 10,
                endValue: 11,
                color: Colors.orange,
              ),
              LinearGaugeRange(
                startValue: 11,
                endValue: 12,
                color: Colors.deepOrangeAccent,
              ),
              LinearGaugeRange(
                startValue: 12,
                endValue: 13,
                color: Colors.redAccent,
              ),
              LinearGaugeRange(
                startValue: 13,
                endValue: 14,
                color: Colors.red,
              ),
            ],
            minimum: 0.0,
            maximum: 14.0,
            interval: 1.0,
            orientation: LinearGaugeOrientation.horizontal,
            axisLabelStyle:
                const TextStyle(fontSize: 12.0, color: Colors.black),
            axisTrackStyle: const LinearAxisTrackStyle(
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
    );
  }
}
