import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AmmoniaGaugeBasic extends StatelessWidget {
  final double value;

  const AmmoniaGaugeBasic({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        // Wrap the gauge in a Column to include a title
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Ammonia Level',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SfLinearGauge(
            ranges: const [
              LinearGaugeRange(startValue: 0, endValue: 1, color: Colors.green),
              LinearGaugeRange(
                startValue: 1,
                endValue: 2,
                color: Colors.lightGreen,
              ),
              LinearGaugeRange(
                startValue: 2,
                endValue: 3,
                color: Colors.limeAccent,
              ),
              LinearGaugeRange(
                startValue: 3,
                endValue: 4,
                color: Color.fromARGB(255, 255, 246, 116),
              ),
              LinearGaugeRange(
                startValue: 4,
                endValue: 5,
                color: Color.fromARGB(255, 255, 193, 59),
              ),
              LinearGaugeRange(
                startValue: 5,
                endValue: 6,
                color: Colors.orange,
              ),
              LinearGaugeRange(
                startValue: 6,
                endValue: 7,
                color: Colors.deepOrange,
              ),
              LinearGaugeRange(
                startValue: 7,
                endValue: 8,
                color: Colors.red,
              ),
            ],
            minimum: 0.0,
            maximum: 8.0,
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
