import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../app_colors.dart';

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({super.key, required this.data});
  
  final Map<String, double> data;

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  final maxTitleLen = 19;
  // Map<String, double> dataMap;
  //  = {
  //   "Flutter": 5,
  //   "React": 3,
  //   "Xamarin": 2,
  //   "Ionic": 2,
  // };

  List<Color> colorList = [
    AppColor.grey,
    AppColor.blue,
    AppColor.yellow,
    AppColor.normalGreen,
    AppColor.darkGreen,
    AppColor.pink,
    AppColor.dark,
    AppColor.purple
  ];

  Map<String, double> getData() {
    List<MapEntry<String, double>> elements = widget.data.entries.toList();
    elements.sort((a, b) => b.value.compareTo(a.value));
    if (elements.length > 5) {
      double sum = 0;
      for (int i = 5; i < elements.length; i++) {
        sum += elements[i].value;
      }
      elements = elements.sublist(0, 5);
      elements.add(MapEntry("Other", sum));
    }

    Map<String, double> newMap = {};
    for (var element in elements) {
      final key = element.key.length > maxTitleLen ? "${element.key.substring(0, maxTitleLen-3)}..." : element.key;
      newMap[key] = element.value;
    }

    return newMap;
  }

  @override
  Widget build(BuildContext context) {    
    return PieChart(
      dataMap: getData(),
      animationDuration: const Duration(milliseconds: 1000),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 15,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
        chartValueStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
