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

  @override
  Widget build(BuildContext context) {    
    return PieChart(
            dataMap: widget.data,
            animationDuration: const Duration(milliseconds: 1000),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 20,
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
            ),
    );
  }
}
