import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/models/dashboard_data.dart';

class EcommerceController extends MyController {
  String selectedTimeBySales = "Year";
  String selectedTimeByBalance = "Year";
  List<DashBoardData> dashboard = [];

  final List<ChartSampleData> salesChartData = [
    ChartSampleData(x: 'Sun', y: 10),
    ChartSampleData(x: 'Mon', y: 20),
    ChartSampleData(x: 'Tue', y: 15),
    ChartSampleData(x: 'Wed', y: 20),
    ChartSampleData(x: 'The', y: 30),
    ChartSampleData(x: 'Fri', y: 20),
    ChartSampleData(x: 'Sat', y: 40),
  ];
  final TooltipBehavior chart = TooltipBehavior(
    enable: true,
    format: 'point.x : point.y',
  );

  final List<ChartSampleData> balanceChart = [
    ChartSampleData(x: 2010, y: 35),
    ChartSampleData(x: 2011, y: 13),
    ChartSampleData(x: 2012, y: 34),
    ChartSampleData(x: 2013, y: 27),
    ChartSampleData(x: 2014, y: 40)
  ];

  final List<ChartSampleData> revenueChart1 = <ChartSampleData>[
    ChartSampleData(x: 'Mon', y: 20),
    ChartSampleData(x: 'Tue', y: 15),
    ChartSampleData(x: 'Wed', y: 35),
    ChartSampleData(x: 'The', y: 30),
    ChartSampleData(x: 'Fri', y: 45),
    ChartSampleData(x: 'Sat', y: 20),
    ChartSampleData(x: 'Sun', y: 40)
  ];
  final List<ChartSampleData> revenueChart2 = <ChartSampleData>[
    ChartSampleData(x: 'Mon', y: 5),
    ChartSampleData(x: 'Tue', y: 20),
    ChartSampleData(x: 'Wed', y: 40),
    ChartSampleData(x: 'The', y: 30),
    ChartSampleData(x: 'Fri', y: 15),
    ChartSampleData(x: 'Sat', y: 50),
    ChartSampleData(x: 'Sun', y: 15)
  ];
  final TooltipBehavior revenue = TooltipBehavior(
    enable: true,
    tooltipPosition: TooltipPosition.pointer,
    format: 'point.x : point.y',
  );

  @override
  void onInit() {
    DashBoardData.dummyList.then((value) {
      dashboard = value;
      update();
    });
    super.onInit();
  }

  void onSelectedTimeBySales(String time) {
    selectedTimeBySales = time;
    update();
  }

  void onSelectedTimeByBalance(String time) {
    selectedTimeByBalance = time;
    update();
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
