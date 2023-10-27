import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'gauge.dart';

class WaterTempGauge extends StatelessWidget {
  final double value;

  WaterTempGauge({required this.value});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
        title: GaugeTitle(
          text: 'Water Temperature',
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Set the text color to black
          ),
        ),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 50, ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: 15, color: Colors.blue, startWidth: 10, endWidth: 10),
            GaugeRange(startValue: 15, endValue: 20, color: Colors.lightBlue, startWidth: 10, endWidth: 10),
            GaugeRange(startValue: 20, endValue: 25, color: Colors.green, startWidth: 10, endWidth: 10),
            GaugeRange(startValue: 25, endValue: 30, color: Colors.lightGreen, startWidth: 10, endWidth: 10),
            GaugeRange(startValue: 30, endValue: 35, color: Colors.yellow, startWidth: 10, endWidth: 10),
            GaugeRange(startValue: 35, endValue: 40, color: Colors.orange, startWidth: 10, endWidth: 10),
            GaugeRange(startValue: 40, endValue: 45, color: Colors.deepOrange, startWidth: 10, endWidth: 10),
            GaugeRange(startValue: 45, endValue: 50, color: Colors.red, startWidth: 10, endWidth: 10)
          ], pointers: <GaugePointer>[
            NeedlePointer(value: value)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text('$value °C',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }
}
