import 'package:flutter/material.dart';

import '../../data/constants.dart';

class ChartTile extends StatelessWidget {
  final SelectedChart chart;

  const ChartTile({Key key, @required this.chart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chartType = selectedChartString[chart.index];
    return Text(chartType, style: const TextStyle(fontWeight: FontWeight.w600));
  }
}
