import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webui/controller/job_dashboard_controller.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/utils/utils.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_list_extension.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/layout.dart';

class JobDashboardScreen extends StatefulWidget {
  const JobDashboardScreen({super.key});

  @override
  State<JobDashboardScreen> createState() => _JobDashboardScreenState();
}

class _JobDashboardScreenState extends State<JobDashboardScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late JobDashboardController controller;

  @override
  void initState() {
    controller = Get.put(JobDashboardController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'job_dashboard_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Job",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Dashboard'),
                        MyBreadcrumbItem(name: 'Job', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(children: [
                  stateCardDetail(LucideIcons.user_check, "Total Employee",
                      "281", contentTheme.success),
                  stateCardDetail(LucideIcons.wallet, "Gross Salary", "\$293",
                      contentTheme.info),
                  stateCardDetail(LucideIcons.receipt_text, "Net Payable",
                      "\$723", contentTheme.secondary),
                  stateCardDetail(LucideIcons.album, "Job Applied", "328",
                      contentTheme.primary),
                  MyFlexItem(sizes: 'lg-9 md-6', child: listingPerformance()),
                  MyFlexItem(sizes: 'lg-3 md-6', child: workingFormat()),
                  MyFlexItem(sizes: 'lg-3 md-6', child: newJob()),
                  MyFlexItem(sizes: 'lg-9 md-6', child: employeeStatus()),
                ]),
              )
            ],
          );
        },
      ),
    );
  }

  Widget employeeStatus() {
    return MyCard(
      shadow: MyShadow(elevation: .5),
      borderRadiusAll: 8,
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium("Employee Status", fontWeight: 600),
              MyContainer.bordered(
                paddingAll: 6,
                child: MyText.bodySmall("View All", fontWeight: 600),
              )
            ],
          ),
          if (controller.employeeData.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: DataTable(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                columnSpacing: 60,
                columns: [
                  DataColumn(
                    label:
                        MyText.labelLarge('Name', color: contentTheme.primary),
                  ),
                  DataColumn(
                    label: MyText.labelLarge('Joining Date',
                        color: contentTheme.primary),
                  ),
                  DataColumn(
                    label: MyText.labelLarge('Job Title',
                        color: contentTheme.primary),
                  ),
                  DataColumn(
                    label:
                        MyText.labelLarge('Team', color: contentTheme.primary),
                  ),
                  DataColumn(
                    label: MyText.labelLarge('Salary',
                        color: contentTheme.primary),
                  ),
                  DataColumn(
                    label: MyText.labelLarge('Performance',
                        color: contentTheme.primary),
                  ),
                  DataColumn(
                    label: MyText.labelLarge('Status',
                        color: contentTheme.primary),
                  ),
                ],
                rows: controller.employeeData
                    .mapIndexed((index, data) => DataRow(
                          cells: [
                            DataCell(Row(
                              children: [
                                MyContainer.rounded(
                                    height: 32,
                                    width: 32,
                                    paddingAll: 0,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.asset(
                                        Images.avatars[
                                            index % Images.avatars.length],
                                        fit: BoxFit.cover)),
                                MySpacing.width(12),
                                MyText.bodySmall(data.name, fontWeight: 600)
                              ],
                            )),
                            DataCell(MyText.bodySmall(
                                Utils.getDateStringFromDateTime(
                                    data.joiningDate),
                                fontWeight: 600)),
                            DataCell(MyText.bodySmall(data.jobTitle,
                                fontWeight: 600)),
                            DataCell(
                                MyText.bodySmall(data.team, fontWeight: 600)),
                            DataCell(MyText.bodySmall("\$${data.salary}",
                                fontWeight: 600)),
                            DataCell(MyText.bodySmall(data.performance,
                                fontWeight: 600)),
                            DataCell(
                                MyText.bodySmall(data.status, fontWeight: 600)),
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }

  Widget newJob() {
    Widget image(double imageSize, imageNumber) {
      return MyContainer.rounded(
          height: imageSize,
          width: imageSize,
          paddingAll: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(Images.avatars[imageNumber], fit: BoxFit.cover));
    }

    return MyCard(
      paddingAll: 24,
      borderRadiusAll: 8,
      shadow: MyShadow(elevation: .5),
      height: 425,
      child: Stack(
        children: [
          image(44, 0),
          Positioned(right: 0, bottom: 0, child: image(44, 1)),
          Positioned(right: 0, top: 0, child: image(44, 2)),
          Positioned(left: 0, bottom: 0, child: image(44, 3)),
          Positioned(
              left: MediaQuery.of(context).size.width * .12,
              top: 0,
              child: image(44, 4)),
          Positioned(left: 50, bottom: 100, child: image(44, 5)),
          Positioned(
              left: MediaQuery.of(context).size.width * .12,
              bottom: 40,
              child: image(44, 6)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: MyText.titleLarge("Your Dream job is here",
                      fontWeight: 700)),
              MySpacing.height(20),
              Center(
                child: MyText.bodyMedium(
                    "Explore more than 500k profiles post your job to start",
                    fontWeight: 600,
                    textAlign: TextAlign.center),
              ),
              MySpacing.height(20),
              MyContainer(
                paddingAll: 12,
                color: contentTheme.primary,
                child: MyText.bodyMedium("Post New Job",
                    fontWeight: 600, color: contentTheme.onPrimary),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget workingFormat() {
    return MyCard(
      shadow: MyShadow(elevation: .5),
      borderRadiusAll: 8,
      paddingAll: 24,
      height: 408,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.titleMedium("Working Format", height: .8, fontWeight: 600),
            workingFormatChart()
          ]),
    );
  }

  SfCircularChart workingFormatChart() {
    return SfCircularChart(
        legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap),
        series: controller.workingFormatChart());
  }

  Widget listingPerformance() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(elevation: .5),
      padding: MySpacing.fromLTRB(24, 24, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MyText.titleMedium("Listing Performance",
                    fontWeight: 600, overflow: TextOverflow.ellipsis),
              ),
              isSelectTime("Day", 0),
              MySpacing.width(12),
              isSelectTime("Week", 1),
              MySpacing.width(12),
              isSelectTime("Month", 2),
            ],
          ),
          MySpacing.height(20),
          listingPerformanceChart(),
        ],
      ),
    );
  }

  Widget isSelectTime(String title, int index) {
    bool isSelect = controller.isSelectedListingPerformanceTime == index;
    return MyContainer.bordered(
      paddingAll: 8,
      borderRadiusAll: 8,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: isSelect ? contentTheme.secondary.withAlpha(39) : null,
      onTap: () => controller.onSelectListingPerformanceTimeToggle(index),
      child: MyText.bodySmall(title,
          fontWeight: 600, color: isSelect ? contentTheme.secondary : null),
    );
  }

  SfCartesianChart listingPerformanceChart() {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            maximum: 20,
            minimum: 0,
            interval: 4,
            axisLine: AxisLine(width: 0),
            majorTickLines: MajorTickLines(size: 0)),
        series: controller.getDefaultColumn(),
        legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            alignment: ChartAlignment.center,
            height: "10%",
            orientation: LegendItemOrientation.horizontal),
        tooltipBehavior: controller.columnToolTip);
  }

  MyFlexItem stateCardDetail(
      IconData icon, String title, subTitle, Color color) {
    return MyFlexItem(
      sizes: 'lg-3 md-6 sm-6',
      child: MyCard(
        shadow: MyShadow(elevation: .5),
        paddingAll: 24,
        borderRadiusAll: 8,
        child: Row(
          children: [
            MyContainer.rounded(
                paddingAll: 0,
                height: 56,
                width: 56,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: color.withAlpha(32),
                child: Icon(icon, color: color)),
            MySpacing.width(24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium(title,
                      fontWeight: 600, overflow: TextOverflow.ellipsis),
                  MyText.titleLarge(subTitle, fontWeight: 600)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
