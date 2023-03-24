import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/receipt.dart';

import '../app_colors.dart';

class Chart extends StatefulWidget {
  const Chart({super.key, required this.data});

  final List<Receipt> data;

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Color> gradientColors = [
    AppColor.normalGreen,
    AppColor.blue,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: AppColor.grey
    );
    
    String text = widget.data[value.toInt()].shortFormattedCreatedAt;

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: AppColor.grey
    );

    if (
      value != minYValue().floor().toDouble() 
      && value != maxYValue().ceil().toDouble()
      && value != (maxYValue() - getPadding()).ceil().toDouble()
    ) {
      return Container();
    }
    
    return Text("${value.toStringAsFixed(0)} kg", style: style, textAlign: TextAlign.left);
  }

  List<FlSpot> getSpots() {
    List<FlSpot> spots = [];
    for (var i = 0; i < widget.data.length; i++) {
      spots.add(FlSpot(i.toDouble(), widget.data.elementAt(i).totalCarbon));
    }
    return spots;
  }

  double maxYValue() {
    double max = 0;
    for (var e in widget.data) {
      if (e.totalCarbon > max) {
        max = e.totalCarbon;
      }
    }
    return max;
  }

  double minYValue() {
    if (widget.data.isEmpty) return 0;

    double min = widget.data.first.totalCarbon;
    for (var e in widget.data) {
      if (e.totalCarbon < min) {
        min = e.totalCarbon;
      }
    }

    return min;
  }

  double getPadding() {
    return (maxYValue() - minYValue()) / 2;
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        horizontalInterval: getPadding(),
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColor.grey,
            strokeWidth: 0.2, // make the lines thinner
          );
        },
      ),
      
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        // border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: widget.data.length.toDouble() - 1,
      minY: (minYValue() - getPadding()).floor().toDouble(),
      maxY: (maxYValue() + getPadding()).ceil().toDouble(),
      lineBarsData: [
        LineChartBarData(
          spots: getSpots(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}