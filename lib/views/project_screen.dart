import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webui/controller/project_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_list_extension.dart';
import 'package:webui/helper/widgets/my_progress_bar.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/layout.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ProjectController controller;

  @override
  void initState() {
    controller = Get.put(ProjectController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "project".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'dashboard'.tr()),
                        MyBreadcrumbItem(name: 'project'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                        sizes: 'lg-3',
                        child: MyFlex(
                          contentPadding: false,
                          children: [
                            MyFlexItem(
                                child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              paddingAll: 0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: MySpacing.xy(16, 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText.bodyMedium(
                                          'Project Summary',
                                          fontWeight: 600,
                                          muted: true,
                                        ),
                                        buildPopUpMenu()
                                      ],
                                    ),
                                  ),
                                  MyContainer(
                                    borderRadiusAll: 0,
                                    paddingAll: 8,
                                    color: contentTheme.warning.withAlpha(38),
                                    child: Row(
                                      children: [
                                        Icon(
                                          LucideIcons.folder_dot,
                                          size: 20,
                                          color: contentTheme.warning,
                                        ),
                                        MySpacing.width(12),
                                        MyText.bodyMedium(
                                          '10 Total Projects',
                                          color: contentTheme.warning,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: MySpacing.xy(16, 16),
                                    child: Column(
                                      children: [
                                        buildProjectSummaryDetail(
                                          LucideIcons.users,
                                          contentTheme.blue,
                                          'Project Discussion',
                                          '16 Person',
                                        ),
                                        MySpacing.height(16),
                                        buildProjectSummaryDetail(
                                          LucideIcons.circle_dot_dashed,
                                          contentTheme.warning,
                                          'In Progress',
                                          '20 Projects',
                                        ),
                                        MySpacing.height(16),
                                        buildProjectSummaryDetail(
                                          LucideIcons.circle_check,
                                          contentTheme.danger,
                                          'Complete Project',
                                          '30',
                                        ),
                                        MySpacing.height(16),
                                        buildProjectSummaryDetail(
                                          LucideIcons.send,
                                          contentTheme.success,
                                          'Delivery Project',
                                          '15',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            MyFlexItem(
                              child: MyCard(
                                shadow: MyShadow(elevation: 0.5),
                                padding: MySpacing.xy(16, 16),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: MyText.bodyMedium(
                                            'On Time Completed Rate',
                                            fontWeight: 600,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        MySpacing.width(12),
                                        MyContainer(
                                          paddingAll: 4,
                                          color: contentTheme.success
                                              .withAlpha(39),
                                          child: Row(
                                            children: [
                                              Icon(
                                                LucideIcons.arrow_up,
                                                size: 16,
                                                color: contentTheme.success,
                                              ),
                                              MySpacing.width(4),
                                              MyText.bodySmall(
                                                '10 %',
                                                fontWeight: 600,
                                                color: contentTheme.success,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    MySpacing.height(12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText.bodyMedium(
                                          'Complete Project',
                                          fontWeight: 600,
                                          muted: true,
                                        ),
                                        MyText.bodyMedium(
                                          '50 %',
                                          fontWeight: 600,
                                          muted: true,
                                        ),
                                      ],
                                    ),
                                    MySpacing.height(8),
                                    MyProgressBar(
                                      width: 400,
                                      progress: 0.5,
                                      height: 4,
                                      radius: 4,
                                      inactiveColor: theme.dividerColor,
                                      activeColor: contentTheme.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    MyFlexItem(
                      sizes: 'lg-9',
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: 'lg-3',
                            child: buildDashboardContainer(
                              'Project Dashboard',
                              'Update Dashboard',
                              '1 Hrs ago',
                              [
                                Images.avatars[0],
                                Images.avatars[1],
                              ],
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-3',
                            child: buildDashboardContainer(
                              'Admin Template',
                              'Update Template',
                              '5 Hrs ago',
                              [
                                Images.avatars[2],
                                Images.avatars[3],
                              ],
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-3',
                            child: buildDashboardContainer(
                              'Client Project',
                              'Update Client',
                              '10 Hrs ago',
                              [
                                Images.avatars[4],
                                Images.avatars[5],
                              ],
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-3',
                            child: buildDashboardContainer(
                              'Figma Design',
                              'Update Figma',
                              '5 Day ago',
                              [
                                Images.avatars[6],
                                Images.avatars[7],
                              ],
                            ),
                          ),
                          MyFlexItem(
                              sizes: 'lg-4', child: buildMonthlyTargetData()),
                          MyFlexItem(
                            sizes: 'lg-8',
                            child: buildProjectStaticData(),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                              sizes: 'lg-3 md-6', child: buildDailyTask()),
                          MyFlexItem(
                              sizes: 'lg-3 md-6', child: buildTeamMember()),
                          MyFlexItem(
                              sizes: 'lg-6', child: buildProjectOverView()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildCard(
    Color color,
    IconData icons,
    String accountType,
    String price,
    IconData trendingIcon,
    Color trendingIconColor,
    String percentage,
  ) {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      padding: MySpacing.xy(16, 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MyText.bodyLarge(
                  accountType,
                  fontSize: 16,
                  fontWeight: 600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              MyContainer(
                height: 70,
                width: 70,
                paddingAll: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: color.withAlpha(30),
                child: Icon(
                  icons,
                  color: color,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    MyText.bodyLarge(
                      price,
                      fontWeight: 600,
                      fontSize: 28,
                    ),
                    MySpacing.width(8),
                    Icon(
                      trendingIcon,
                      color: trendingIconColor,
                      size: 16,
                    ),
                    MySpacing.width(8),
                    MyText.bodyMedium(
                      "$percentage%",
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildProjectStaticData() {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium('Project Statistics'),
              Row(
                children: [
                  MyContainer(
                    padding: MySpacing.xy(12, 4),
                    onTap: () {
                      controller.select(1);
                    },
                    color: controller.selectTime == 1
                        ? contentTheme.primary.withAlpha(39)
                        : contentTheme.secondary.withAlpha(39),
                    child: MyText.bodyMedium(
                      'All',
                      color: controller.selectTime == 1
                          ? contentTheme.primary
                          : contentTheme.secondary,
                    ),
                  ),
                  MySpacing.width(12),
                  MyContainer(
                    padding: MySpacing.xy(12, 4),
                    onTap: () {
                      controller.select(2);
                    },
                    color: controller.selectTime == 2
                        ? contentTheme.primary.withAlpha(39)
                        : contentTheme.secondary.withAlpha(39),
                    child: MyText.bodyMedium(
                      '6M',
                      color: controller.selectTime == 2
                          ? contentTheme.primary
                          : contentTheme.secondary,
                    ),
                  ),
                  MySpacing.width(12),
                  MyContainer(
                    padding: MySpacing.xy(12, 4),
                    onTap: () {
                      controller.select(3);
                    },
                    color: controller.selectTime == 3
                        ? contentTheme.primary.withAlpha(39)
                        : contentTheme.secondary.withAlpha(39),
                    child: MyText.bodyMedium(
                      '1Y',
                      color: controller.selectTime == 3
                          ? contentTheme.primary
                          : contentTheme.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          MySpacing.height(32),
          SizedBox(
            height: 360,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              legend: Legend(isVisible: true, position: LegendPosition.bottom),
              series: [
                ColumnSeries<ChartSampleData, int>(
                    opacity: 0.9,
                    width: 0.3,
                    color: Color.fromRGBO(52, 116, 253, 0.6823529411764706),
                    dataSource: controller.columnChart,
                    xValueMapper: (ChartSampleData data, _) => data.x,
                    yValueMapper: (ChartSampleData data, _) => data.y,
                    dataLabelSettings:
                        const DataLabelSettings(isVisible: true)),
                ColumnSeries<ChartSampleData, int>(
                  color: contentTheme.primary,
                  dataSource: controller.columnChart,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMonthlyTargetData() {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium(
            'Monthly Target',
            fontWeight: 600,
          ),
          MySpacing.height(28),
          _buildDefaultDoughnutChart(),
          MySpacing.height(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  MyText.bodyMedium(
                    'Pending',
                    fontWeight: 600,
                  ),
                  Row(
                    children: [
                      MyContainer.rounded(
                        paddingAll: 4,
                        color: Color.fromRGBO(52, 116, 253, 1.0),
                      ),
                      MySpacing.width(8),
                      MyText.bodyMedium('Project'),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  MyText.bodyMedium(
                    'Done',
                    fontWeight: 600,
                  ),
                  Row(
                    children: [
                      MyContainer.rounded(
                        paddingAll: 4,
                        color: Color.fromRGBO(2, 79, 31, 1.0),
                      ),
                      MySpacing.width(8),
                      MyText.bodyMedium('Project'),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildProjectOverView() {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                'Project OverView',
                fontWeight: 600,
              ),
              buildCustomPopUpMenu()
            ],
          ),
          MyFlex(
            children: [
              MyFlexItem(
                sizes: 'lg-6',
                child: _buildDefaultRadialBarChart(),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: Column(
                  children: [
                    buildProjectOverViewDetail(
                      contentTheme.blue,
                      'Product Design',
                      '7',
                    ),
                    buildProjectOverViewDetail(
                      contentTheme.danger,
                      'Web Development',
                      '15',
                    ),
                    buildProjectOverViewDetail(
                      contentTheme.success,
                      'Illustration Design',
                      '4',
                    ),
                    buildProjectOverViewDetail(
                      contentTheme.info,
                      'UI/UX Design',
                      '12',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDailyTask() {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      paddingAll: 0,
      child: Column(
        children: [
          Padding(
            padding: MySpacing.nBottom(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.bodyMedium('Daily Task'),
                PopupMenuButton(
                  onSelected: controller.onDailyTask,
                  itemBuilder: (BuildContext context) {
                    return [
                      "Today",
                      "Yesterday",
                      "Tomorrow",
                    ].map((behavior) {
                      return PopupMenuItem(
                        value: behavior,
                        height: 32,
                        child: MyText.bodySmall(
                          behavior.toString(),
                          color: theme.colorScheme.onSurface,
                          fontWeight: 600,
                        ),
                      );
                    }).toList();
                  },
                  color: theme.cardTheme.color,
                  child: MyContainer.bordered(
                    padding: MySpacing.xy(8, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MyText.labelMedium(
                          controller.selectedDailyTask.toString(),
                          color: contentTheme.onBackground,
                        ),
                        Icon(
                          LucideIcons.chevron_down,
                          size: 20,
                          color: contentTheme.onBackground,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24,
          ),
          SizedBox(
            height: 310,
            child: Padding(
              padding: MySpacing.x(16),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: controller.dailyTask['taskList'].length,
                separatorBuilder: (context, index) {
                  return MyContainer.bordered(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyMedium(
                          controller.dailyTask['taskList'][index]
                              ['pageDesignName'],
                          fontWeight: 600,
                        ),
                        MyText.bodySmall(
                          controller.dailyTask['taskList'][index]['pageName'],
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Icon(
                              LucideIcons.users,
                              size: 18,
                            ),
                            MySpacing.width(12),
                            MyText.bodyMedium(
                              "${controller.dailyTask['taskList'][index]['people']} People",
                              textAlign: TextAlign.end,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTeamMember() {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      paddingAll: 0,
      child: Column(
        children: [
          Padding(
            padding: MySpacing.nBottom(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.bodyMedium('Team Members'),
                PopupMenuButton(
                  onSelected: controller.onTeamMember,
                  itemBuilder: (BuildContext context) {
                    return [
                      "Active",
                      "Offline",
                    ].map((behavior) {
                      return PopupMenuItem(
                        value: behavior,
                        height: 32,
                        child: MyText.bodySmall(
                          behavior.toString(),
                          color: theme.colorScheme.onSurface,
                          fontWeight: 600,
                        ),
                      );
                    }).toList();
                  },
                  color: theme.cardTheme.color,
                  child: MyContainer.bordered(
                    padding: MySpacing.xy(8, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MyText.labelMedium(
                          controller.selectedTeamMember.toString(),
                          color: contentTheme.onBackground,
                        ),
                        Icon(
                          LucideIcons.chevron_down,
                          size: 22,
                          color: contentTheme.onBackground,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24,
          ),
          SizedBox(
            height: 310,
            child: Padding(
              padding: MySpacing.x(16),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: controller.teamMember['memberList'].length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      MyContainer.none(
                        borderRadiusAll: 20,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          Images.avatars[index % Images.avatars.length],
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      MySpacing.width(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodyMedium(
                            controller.teamMember['memberList'][index]['name'],
                            fontWeight: 600,
                          ),
                          Row(
                            children: [
                              MyText.bodySmall(
                                controller.teamMember['memberList'][index]
                                    ['languageName'],
                                fontWeight: 600,
                                muted: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildProjectOverViewDetail(
      Color color, String title, String projects) {
    return MyContainer(
      child: Row(
        children: [
          MyContainer.rounded(
            paddingAll: 8,
            color: color.withAlpha(39),
            child: MyContainer.rounded(
              paddingAll: 8,
              color: color,
            ),
          ),
          MySpacing.width(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodyMedium(
                title,
                fontWeight: 600,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: projects,
                            style: MyTextStyle.bodyMedium(fontWeight: 600)),
                        TextSpan(text: ' Total Projects'),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  SfCircularChart _buildDefaultRadialBarChart() {
    List<RadialBarSeries<ChartSampleData, String>> getRadialBarDefaultSeries() {
      return <RadialBarSeries<ChartSampleData, String>>[
        RadialBarSeries<ChartSampleData, String>(
            maximumValue: 15,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
            dataSource: controller.radialChartData,
            cornerStyle: CornerStyle.bothCurve,
            gap: '10%',
            radius: '90%',
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) => data.y,
            pointRadiusMapper: (ChartSampleData data, _) => data.text,
            pointColorMapper: (ChartSampleData data, _) => data.pointColor,
            dataLabelMapper: (ChartSampleData data, _) => data.x as String)
      ];
    }

    return SfCircularChart(
      key: GlobalKey(),
      series: getRadialBarDefaultSeries(),
      tooltipBehavior: controller.radialTooltipBehavior,
    );
  }

  Widget buildProjectData(
      Color color, IconData icon, String title, String number) {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      child: Row(
        children: [
          MyContainer(
            paddingAll: 0,
            height: 50,
            width: 50,
            color: color.withAlpha(39),
            child: Icon(icon, color: color),
          ),
          MySpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  title,
                  fontWeight: 600,
                ),
                MySpacing.height(4),
                MyText.bodyMedium(number),
              ],
            ),
          ),
          buildCustomPopUpMenu()
        ],
      ),
    );
  }

  SfCircularChart _buildDefaultDoughnutChart() {
    List<DoughnutSeries<ChartSampleData, String>> getDefaultDoughnutSeries() {
      return <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            explode: true,
            dataSource: controller.doughnutChartData,
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) => data.y,
            dataLabelSettings: const DataLabelSettings(isVisible: true))
      ];
    }

    return SfCircularChart(
      palette: [contentTheme.primary, Color(0xff2c60c9)],
      series: getDefaultDoughnutSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  Widget buildDashboardContainer(
      String title, String subTitle, String time, List<String> images) {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyText.bodyMedium(
                  title,
                  fontWeight: 600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              buildPopUpMenu()
            ],
          ),
          MyText.bodyMedium(
            subTitle,
            fontWeight: 600,
            xMuted: true,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.alarm_clock,
                      size: 16,
                    ),
                    MySpacing.width(8),
                    Expanded(
                      child: MyText.bodyMedium(
                        time,
                        muted: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 75,
                height: 50,
                child: Stack(
                    alignment: Alignment.centerRight,
                    children: images
                        .mapIndexed((index, image) => Positioned(
                              left: (18 + (20 * index)).toDouble(),
                              child: MyContainer.roundBordered(
                                paddingAll: 1,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: MyContainer.rounded(
                                  bordered: true,
                                  paddingAll: 0,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    image,
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ))
                        .toList()),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildProjectSummaryDetail(
      IconData icon, Color color, String title, String subTitle) {
    return MyContainer.bordered(
      paddingAll: 0,
      padding: MySpacing.xy(12, 12),
      child: Row(
        children: [
          MyContainer.rounded(
            height: 50,
            width: 50,
            paddingAll: 0,
            color: color.withAlpha(38),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          MySpacing.width(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  title,
                  fontWeight: 600,
                  overflow: TextOverflow.ellipsis,
                ),
                MySpacing.height(4),
                MyText.bodyMedium(
                  subTitle,
                  fontWeight: 600,
                  xMuted: true,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Icon(LucideIcons.info, size: 20),
        ],
      ),
    );
  }

  Widget buildPopUpMenu() {
    return PopupMenuButton(
      offset: Offset(0, 20),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
            padding: MySpacing.xy(16, 8),
            height: 10,
            child: Row(
              children: [
                Icon(
                  LucideIcons.circle_plus,
                  size: 16,
                ),
                MySpacing.width(8),
                MyText.bodySmall("Add")
              ],
            )),
        PopupMenuItem(
            padding: MySpacing.xy(16, 8),
            height: 10,
            child: Row(
              children: [
                Icon(
                  LucideIcons.file_pen,
                  size: 16,
                ),
                MySpacing.width(8),
                MyText.bodySmall("Edit")
              ],
            )),
        PopupMenuItem(
            padding: MySpacing.xy(16, 8),
            height: 10,
            child: Row(
              children: [
                Icon(
                  LucideIcons.copy,
                  size: 16,
                ),
                MySpacing.width(8),
                MyText.bodySmall("Copy")
              ],
            )),
        PopupMenuItem(
          padding: MySpacing.xy(16, 8),
          height: 10,
          child: Row(
            children: [
              Icon(
                LucideIcons.trash_2,
                size: 16,
              ),
              MySpacing.width(8),
              MyText.bodySmall("Delete")
            ],
          ),
        ),
      ],
      child: Icon(
        LucideIcons.ellipsis,
        size: 20,
      ),
    );
  }

  Widget buildCustomPopUpMenu() {
    return PopupMenuButton(
      icon: Icon(LucideIcons.ellipsis_vertical, size: 20),
      itemBuilder: (context) => [
        PopupMenuItem(
            padding: MySpacing.xy(16, 8),
            height: 10,
            child: MyText.bodySmall("Today")),
        PopupMenuItem(
            padding: MySpacing.xy(16, 8),
            height: 10,
            child: MyText.bodySmall("Yesterday")),
        PopupMenuItem(
            padding: MySpacing.xy(16, 8),
            height: 10,
            child: MyText.bodySmall("Last Week")),
        PopupMenuItem(
            padding: MySpacing.xy(16, 8),
            height: 10,
            child: MyText.bodySmall("Last Month")),
      ],
    );
  }
}
