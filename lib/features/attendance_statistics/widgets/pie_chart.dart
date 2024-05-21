// import 'package:crm/core/utils/custom_colors.dart';
// import 'package:crm/core/utils/data_list.dart';
// import 'package:crm/features/sales/presentation/pages/reports/widgets/chartdata.dart';
// import 'package:crm/features/sales/presentation/pages/reports/widgets/graphData.dart';
// import 'package:flutter/material.dart';
// import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class ComplaintChart extends StatelessWidget {
//   const ComplaintChart({
//     super.key,
//     required TooltipBehavior tooltip,
//   }) : _tooltip = tooltip;

//   final TooltipBehavior _tooltip;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: CustomColors.genericWhite,
//       child: 
      
//       SfCircularChart(
//         legend: const Legend(
//           isVisible: true,
//           position: LegendPosition.bottom,
//           overflowMode: LegendItemOverflowMode.wrap,
//           textStyle: TextStyle(fontFamily: 'Urbanist'),
//         ),
//         title: const ChartTitle(
//             text: 'Complaint Chart',
//             textStyle: TextStyle(fontFamily: 'Urbanist')),
//         tooltipBehavior: _tooltip,
//         series: <CircularSeries>[
//           DoughnutSeries<ChartData, String>(
//             explode: true,
//             radius: '80%',
//             legendIconType: LegendIconType.diamond,
//             //explodeAll: true,
//             innerRadius: '35%',
//             dataSource: complaintdata,
//             pointColorMapper: (ChartData complaintdata, _) =>
//                 getStatusColor(complaintdata.x),
//             xValueMapper: (ChartData complaintdata, _) => complaintdata.x,
//             yValueMapper: (ChartData complaintdata, _) => complaintdata.y,
//             dataLabelSettings: const DataLabelSettings(
//               isVisible: true,
//               labelPosition: ChartDataLabelPosition.outside,
//               textStyle: TextStyle(
//                 fontFamily: 'Urbanist',
//               ),
//             ),
//             dataLabelMapper: (ChartData complaintdata, _) =>
//                 '${complaintdata.y.toString()} %',
//           )
//         ],
//       ),
//     );
//   }
// }
