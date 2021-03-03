import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HealthChartDisplay extends StatefulWidget {
  const HealthChartDisplay({
    Key key,
    this.xValues = const [],
    this.yValues = const [],
    this.showTitles = true,
  }) : super(key: key);

  final List<int> xValues;
  final List<double> yValues;
  final bool showTitles;

  @override
  _HealthChartDisplayState createState() => _HealthChartDisplayState();
}

class _HealthChartDisplayState extends State<HealthChartDisplay> {
  double _valueFromList({
    @required List<double> list,
    @required bool isMin,
  }) {
    var least = double.maxFinite;
    var most = -double.maxFinite;
    for (final e in list) {
      if (e < least) least = e;
      if (e > most) most = e;
    }
    return isMin ? least : most;
  }

  @override
  Widget build(BuildContext context) {
    final minX =
        _valueFromList(list: widget.xValues.map((e) => e.toDouble()).toList(), isMin: true);
    final maxX =
        _valueFromList(list: widget.xValues.map((e) => e.toDouble()).toList(), isMin: false);
    final minY = _valueFromList(list: widget.yValues, isMin: true);
    final maxY = _valueFromList(list: widget.yValues, isMin: false);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: LineChart(
        LineChartData(
          clipData: FlClipData.all(),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              showTitles: widget.showTitles,
              // margin: 10,
              reservedSize: 30,
              getTextStyles: (_) => const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 13,
              ),
              // reservedSize: 10,
              interval: ((maxY - minY) / 4).roundToDouble(),
            ),
            bottomTitles: SideTitles(
              showTitles: widget.showTitles,
              interval: ((maxX - minX) / 10).roundToDouble(),
              getTextStyles: (_) => const TextStyle(
                // fontWeight: FontWeight.w500,
                color: Colors.black54,
                // fontSize: 13,
              ),
            ),
          ),
          axisTitleData: FlAxisTitleData(
            show: widget.showTitles,
            bottomTitle: AxisTitle(
              titleText: 'Time',
              // margin: 10,
              showTitle: true,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontSize: 15,
              ),
            ),
            leftTitle: AxisTitle(
              titleText: 'Value',
              margin: 10,
              showTitle: true,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontSize: 15,
              ),
            ),
          ),
          borderData: FlBorderData(
            border: const Border(
              bottom: BorderSide(),
              left: BorderSide(),
            ),
          ),
          minX: (-0.1 * widget.xValues.length).roundToDouble(),
          minY: 1.1 * minY - 0.1 * maxY,
          maxX: (1.1 * widget.xValues.length).roundToDouble(),
          maxY: 1.1 * maxY - 0.1 * minY,
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              colors: [Colors.purple[400]],
              dotData: FlDotData(show: false),
              spots: widget.xValues.map((x) => FlSpot(x.toDouble(), widget.yValues[x])).toList(),
            )
          ],
        ),
      ),
    );
  }
}
