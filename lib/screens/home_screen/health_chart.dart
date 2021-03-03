import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_utilities/flutter_image_utilities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

import '../../data/constants.dart';
import '../../data_model/user_data_model.dart';
import 'chart_tile.dart';
import 'duration_tile.dart';
import 'health_chart_display.dart';

class HealthChart extends StatefulWidget {
  const HealthChart({
    Key key,
    @required this.userData,
  }) : super(key: key);

  final UserDataModel userData;

  @override
  _HealthChartState createState() => _HealthChartState();
}

class _HealthChartState extends State<HealthChart> {
  bool _showTitles = true;
  SelectedDuration _selectedDuration = SelectedDuration.day;
  SelectedChart _selectedChart = SelectedChart.flexion;
  final _screenshotController = ScreenshotController();

  SnackBar getSnackBar(String message) => SnackBar(
        backgroundColor: Colors.white,
        elevation: 3,
        width: MediaQuery.of(context).size.width * 0.5,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: Text(
          message,
          style: const TextStyle(color: Colors.grey),
        ),
      );

  void _toggleTitles() => setState(() => _showTitles = !_showTitles);
  void _changeDuration(SelectedDuration newSelect) => setState(() => _selectedDuration = newSelect);
  void _changeChart(SelectedChart newSelect) => setState(() => _selectedChart = newSelect);
  List<num> _getData(List<num> data) {
    switch (_selectedDuration) {
      case SelectedDuration.day:
        return data.sublist(data.length - dayValue);
      case SelectedDuration.week:
        return data.sublist(data.length - weekValue);
      case SelectedDuration.month:
        return data.sublist(data.length - monthValue);
      case SelectedDuration.max:
        return data;
      default:
        return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(offset: Offset(0.5, 0.5), color: Colors.grey)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _toggleTitles,
                  child: const FaIcon(FontAwesomeIcons.ellipsisV, size: 18),
                ),
                const SizedBox(width: 10),
                Container(
                  // height: 50,
                  width: 120,
                  color: const Color(0xFFFBF7FF),
                  child: DropdownButton<SelectedChart>(
                    dropdownColor: const Color(0xFFFBF7FF),
                    focusColor: const Color(0xFFFBF7FF),
                    iconSize: 0,
                    elevation: 0,
                    isDense: true,
                    underline: const SizedBox(),
                    value: _selectedChart,
                    onChanged: _changeChart,
                    items: const [
                      DropdownMenuItem(
                        value: SelectedChart.flexion,
                        child: ChartTile(chart: SelectedChart.flexion),
                      ),
                      DropdownMenuItem(
                        value: SelectedChart.flex,
                        child: ChartTile(chart: SelectedChart.flex),
                      ),
                      DropdownMenuItem(
                        value: SelectedChart.ion,
                        child: ChartTile(chart: SelectedChart.ion),
                      ),
                      DropdownMenuItem(
                        value: SelectedChart.ray,
                        child: ChartTile(chart: SelectedChart.ray),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 16,
            child: Screenshot(
              controller: _screenshotController,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                color: Colors.white,
                child: HealthChartDisplay(
                  showTitles: _showTitles,
                  xValues: _getData(widget.userData.getTime().reversed.toList())
                      .reversed
                      .map((e) => e.toInt())
                      .toList(),
                  yValues: _getData(widget.userData.getModifiedValues())
                      .map((e) => e.toDouble())
                      .toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Transform.translate(
              offset: const Offset(0, -10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      DurationTile(
                        duration: SelectedDuration.day,
                        selected: _selectedDuration,
                        selectFunction: _changeDuration,
                      ),
                      const SizedBox(width: 20),
                      DurationTile(
                        duration: SelectedDuration.week,
                        selected: _selectedDuration,
                        selectFunction: _changeDuration,
                      ),
                      const SizedBox(width: 20),
                      DurationTile(
                        duration: SelectedDuration.month,
                        selected: _selectedDuration,
                        selectFunction: _changeDuration,
                      ),
                      const SizedBox(width: 20),
                      DurationTile(
                        duration: SelectedDuration.max,
                        selected: _selectedDuration,
                        selectFunction: _changeDuration,
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: SizedBox(
                      width: 80,
                      child: IconButton(
                        icon: const Icon(Icons.download_rounded),
                        onPressed: () async {
                          var dataType;
                          final dir = await getExternalStorageDirectory();
                          final dayType = selectedDurationString[_selectedDuration.index];
                          await showModalBottomSheet(
                            backgroundColor: const Color(0xFFFBF7FF),
                            context: context,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            builder: (context) {
                              return ListView.builder(
                                padding: const EdgeInsets.all(10),
                                physics: const BouncingScrollPhysics(),
                                itemCount: DownloadDataFormat.values.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => FlatButton(
                                  textTheme: ButtonTextTheme.accent,
                                  onPressed: () {
                                    setState(() => dataType = DownloadDataFormat.values[index]);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    downloadDataFormatString[index],
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                          );
                          final path = getPath(dir, dayType);
                          final imageFile = await _screenshotController.capture(
                            path: '${getPath(await getTemporaryDirectory(), dayType)}.png',
                          );
                          if (dataType == DownloadDataFormat.png) {
                            await _screenshotController.capture(path: '$path.png');
                          } else if (dataType == DownloadDataFormat.jpg) {
                            await FlutterImageUtilities.saveAsJpeg(
                              sourceFile: imageFile,
                              destinationFilePath: '$path.jpg',
                              quality: 60,
                              maxWidth: 1920,
                              maxHeight: 1080,
                              scaleMode: ScaleMode.fitKeepAspectRatio,
                            );
                          } else if (dataType == DownloadDataFormat.pdf) {
                            final image = FileImage(imageFile);
                            final imageProvider = await flutterImageProvider(image);
                            final doc = pw.Document();
                            doc.addPage(
                              pw.Page(build: (pw.Context context) {
                                return pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text(
                                      'Data for the last ${dayType == 'Max' ? 'available time' : dayType.toLowerCase()}',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    pw.SizedBox(height: 40),
                                    pw.Image(imageProvider),
                                    pw.SizedBox(height: 10),
                                    pw.Text(
                                      'Taken at ${DateTime.now()}',
                                      style: pw.TextStyle(
                                        fontStyle: pw.FontStyle.italic,
                                        fontSize: 14,
                                      ),
                                      textAlign: pw.TextAlign.right,
                                    ),
                                  ],
                                );
                              }),
                            );
                            final file = File('$path.pdf');
                            file.writeAsBytes(await doc.save());
                          } else {
                            return;
                          }
                          // final pngImage = await _screenshotController.captureAsUiImage();
                          Scaffold.of(context)
                              .showSnackBar(getSnackBar('Graph downloaded at: $path'));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getPath(Directory dir, String dayType) =>
      '${dir.path}/${dayType}_${DateTime.now().toIso8601String()}';
}
