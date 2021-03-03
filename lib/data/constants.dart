enum SelectedDuration {
  day,
  week,
  month,
  max,
}
List<String> selectedDurationString = ['Day', 'Week', 'Month', 'Max'];
enum SelectedChart {
  flexion,
  flex,
  ion,
  ray,
}
List<String> selectedChartString = ['Flexion', 'Flex', 'Ion', 'Ray'];
enum DownloadDataFormat {
  png,
  jpg,
  pdf,
}
List<String> downloadDataFormatString = ['PNG', 'JPEG', 'PDF'];

const dayValue = 11;
const weekValue = 11 * dayValue;
const monthValue = 2 * weekValue;
