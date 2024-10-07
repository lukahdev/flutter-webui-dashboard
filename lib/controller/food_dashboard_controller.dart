import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/models/food_data.dart';

class PolylineModel {
  PolylineModel(this.points);

  final List<MapLatLng> points;
}

class FoodDashboardController extends MyController {
  List<Food> food = [];
  List<Color> gradientColors = [Colors.cyan, Colors.blue];

  late List<MapLatLng> polyline;
  late List<PolylineModel> polylines;
  late MapShapeSource dataSource;
  late MapZoomPanBehavior zoomPanBehavior;
  late int selectedIndex;

  String selectedOrder = "Year";
  String orderMap = "Year";

  void onSelectedOrderRequest(String time) {
    selectedOrder = time;
    update();
  }

  void onSelectedOrderMap(String time) {
    orderMap = time;
    update();
  }

  @override
  void onInit() {
    Food.dummyList.then((value) {
      food = value.sublist(0, 10);
      update();
    });
    polyline = <MapLatLng>[
      MapLatLng(13.0827, 80.2707),
      MapLatLng(13.1746, 79.6117),
      MapLatLng(13.6373, 79.5037),
      MapLatLng(14.4673, 78.8242),
      MapLatLng(14.9091, 78.0092),
      MapLatLng(16.2160, 77.3566),
      MapLatLng(17.1557, 76.8697),
      MapLatLng(18.0975, 75.4249),
      MapLatLng(18.5204, 73.8567),
      MapLatLng(19.0760, 72.8777),
    ];

    polylines = <PolylineModel>[
      PolylineModel(polyline),
    ];
    dataSource = MapShapeSource.asset(
      'assets/data/world_map.json',
      shapeDataField: 'name',
    );

    zoomPanBehavior = MapZoomPanBehavior(
      zoomLevel: 2,
      focalLatLng: MapLatLng(19.3173, 76.7139),
    );

    selectedIndex = -1;
    super.onInit();
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            // color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
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
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 0.1),
            FlSpot(1, 5),
            FlSpot(3, 2),
            FlSpot(5, 4),
            FlSpot(7, 0),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Sun', style: style);
        break;
      case 2:
        text = const Text('Mon', style: style);
        break;
      case 3:
        text = const Text('Tue', style: style);
        break;
      case 4:
        text = const Text('Wed', style: style);
        break;
      case 5:
        text = const Text('The', style: style);
        break;
      case 6:
        text = const Text('Fri', style: style);
        break;
      case 7:
        text = const Text('Sat', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 2:
        text = '20k';
        break;
      case 3:
        text = '30k';
        break;
      case 4:
        text = '40k';
        break;
      case 5:
        text = '50k';
        break;
      case 6:
        text = '60k';
        break;
      case 7:
        text = '70k';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  List<RadialBarSeries<ChartSampleData, String>> getRadialBarSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Food',
          y: 25,
          text: 'Food  ',
          xValue: null,
          pointColor: const Color.fromRGBO(0, 201, 230, 1.0)),
      ChartSampleData(
          x: 'Drink',
          y: 43,
          text: 'Drink  ',
          xValue: null,
          pointColor: const Color.fromRGBO(63, 224, 0, 1.0)),
      ChartSampleData(
          x: 'Other',
          y: 58,
          text: 'other  ',
          xValue: null,
          pointColor: const Color.fromRGBO(226, 1, 26, 1.0)),
    ];
    final List<RadialBarSeries<ChartSampleData, String>> list =
        <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
          animationDuration: 0,
          maximumValue: 100,
          radius: '100%',
          gap: '16%',
          innerRadius: '50%',
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
    return list;
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
