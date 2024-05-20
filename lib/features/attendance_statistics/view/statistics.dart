import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AttendanceStatistics extends StatefulWidget {
  static const id = '/attendance-statistics';
  const AttendanceStatistics({super.key});

  @override
  State<AttendanceStatistics> createState() => _AttendanceStatisticsState();
}

class _AttendanceStatisticsState extends State<AttendanceStatistics> {
  final List<ChartData> complaintdata = [
    ChartData('Present', 50),
    ChartData('Absent', 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SfCircularChart(
            legend: const Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
            ),
            title: const ChartTitle(
              text: 'Attendance Report',
            ),
            // tooltipBehavior: _tooltip,
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                explode: true,
                radius: '80%',
                legendIconType: LegendIconType.diamond,
                //explodeAll: true,
                // innerRadius: '25%',
                dataSource: complaintdata,
                // pointColorMapper: (ChartData complaintdata, _) =>
                //     getStatusColor(complaintdata.x),
                xValueMapper: (ChartData complaintdata, _) => complaintdata.x,
                yValueMapper: (ChartData complaintdata, _) => complaintdata.y,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  textStyle: TextStyle(
                    fontFamily: 'Urbanist',
                  ),
                ),
                dataLabelMapper: (ChartData complaintdata, _) =>
                    complaintdata.y.toString(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color? color;
}
