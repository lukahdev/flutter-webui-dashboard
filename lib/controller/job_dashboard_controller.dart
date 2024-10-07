import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/models/job_dashboard_employee_data.dart';

class JobDashboardController extends MyController {
  int isSelectedListingPerformanceTime = 0;
  List<ChartSampleData>? chartData;
  TooltipBehavior? columnToolTip;
  List<JobDashboardEmployeeData> employeeData = [];

  @override
  void onInit() {
    JobDashboardEmployeeData.dummyList.then((value) {
      employeeData = value.sublist(0, 6);
      update();
    });
    chartData = <ChartSampleData>[
      ChartSampleData(x: 'Jan', y: 4, secondSeriesYValue: 8),
      ChartSampleData(x: 'Feb', y: 14, secondSeriesYValue: 12),
      ChartSampleData(x: 'Mar', y: 16, secondSeriesYValue: 10),
      ChartSampleData(x: 'Apr', y: 18, secondSeriesYValue: 6),
      ChartSampleData(x: 'May', y: 14, secondSeriesYValue: 17),
      ChartSampleData(x: 'Jun', y: 19, secondSeriesYValue: 8),
      ChartSampleData(x: 'Jul', y: 16, secondSeriesYValue: 17),
      ChartSampleData(x: 'Aug', y: 6, secondSeriesYValue: 4),
      ChartSampleData(x: 'Sep', y: 9, secondSeriesYValue: 9),
      ChartSampleData(x: 'Oct', y: 5, secondSeriesYValue: 13),
      ChartSampleData(x: 'Nov', y: 16, secondSeriesYValue: 11),
      ChartSampleData(x: 'Dec', y: 14, secondSeriesYValue: 15),
    ];

    columnToolTip = TooltipBehavior(enable: true);
    super.onInit();
  }

  void onSelectListingPerformanceTimeToggle(index) {
    isSelectedListingPerformanceTime = index;
    update();
  }

  List<ColumnSeries<ChartSampleData, String>> getDefaultColumn() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
          width: .7,
          spacing: .2,
          dataSource: chartData,
          color: theme.colorScheme.primary,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Views'),
      ColumnSeries<ChartSampleData, String>(
          dataSource: chartData,
          width: .7,
          spacing: .2,
          color: theme.colorScheme.secondary,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Application')
    ];
  }

  List<DoughnutSeries<ChartSampleData, String>> workingFormatChart() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          explode: true,
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'OnSite', y: 55, text: '55%'),
            ChartSampleData(x: 'Remote', y: 31, text: '31%'),
            ChartSampleData(x: 'Hybrid', y: 7.7, text: '7.7%'),
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: DataLabelSettings(isVisible: true))
    ];
  }
}

class ChartSampleData {
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  final dynamic x;
  final num? y;
  final dynamic xValue;
  final num? yValue;
  final num? secondSeriesYValue;
  final num? thirdSeriesYValue;
  final Color? pointColor;
  final num? size;
  final String? text;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
  final num? volume;
}
