import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webui/controller/apps/files/file_manager_controller.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/utils/utils.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
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

class FileManagerPage extends StatefulWidget {
  const FileManagerPage({super.key});

  @override
  State<FileManagerPage> createState() => _FileManagerPageState();
}

class _FileManagerPageState extends State<FileManagerPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late FileManagerController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FileManagerController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "File Manager",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Extra Pages"),
                        MyBreadcrumbItem(name: "File Manager", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  wrapAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  children: [
                    MyFlexItem(
                      sizes: "xxl-9 xl-8 lg-7 xs-12 md-12 sm-12",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyCard(
                            shadow: MyShadow(
                                elevation: 0.5,
                                position: MyShadowPosition.bottom),
                            paddingAll: 22,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyContainer.none(
                                      width: 250,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: contentTheme.primary
                                              .withOpacity(0.08),
                                          prefixIcon: Icon(
                                            Icons.search,
                                            size: 18,
                                            color: contentTheme.primary,
                                          ),
                                          isDense: true,
                                          hintText: "Search Files",
                                          hintStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding:
                                              MySpacing.horizontal(20),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MyContainer.bordered(
                                          paddingAll: 5,
                                          child: Icon(
                                            Icons.list_outlined,
                                            size: 18,
                                          ),
                                        ),
                                        MySpacing.width(6),
                                        MyContainer.bordered(
                                          paddingAll: 5,
                                          child: Icon(
                                            Icons.window_outlined,
                                            size: 18,
                                          ),
                                        ),
                                        MySpacing.width(6),
                                        MyContainer.bordered(
                                          paddingAll: 5,
                                          child: Icon(
                                            Icons.error_outline,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                MySpacing.height(16),
                                MyText.bodyMedium(
                                  "Quick Access",
                                  fontWeight: 600,
                                ),
                                MySpacing.height(16),
                                Wrap(
                                  spacing: 16,
                                  runSpacing: 16,
                                  children: [
                                    buildFile(Icons.folder_outlined,
                                        "WebUi - Zip", 458631),
                                    buildFile(Icons.folder_zip_outlined,
                                        "Compile Version", 1458631),
                                    buildFile(Icons.folder_special_outlined,
                                        "My Admin", 4358631),
                                    buildFile(Icons.folder_shared_outlined,
                                        "Documentation.pdf", 4586531),
                                    buildFile(Icons.source_outlined,
                                        "License-details.pdf", 8456312),
                                    buildFile(Icons.folder_outlined,
                                        "Purchase Verification", 47856),
                                    buildFile(Icons.folder_zip_outlined,
                                        "WebUi Integrations", 125789),
                                  ],
                                ),
                                MySpacing.height(18),
                                MyText.bodyMedium(
                                  "Recent",
                                  fontWeight: 600,
                                ),
                                MySpacing.height(18),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: MyContainer.none(
                                    borderRadiusAll: 4,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: DataTable(
                                      sortAscending: true,
                                      onSelectAll: (_) => {},
                                      headingRowColor: WidgetStatePropertyAll(
                                          contentTheme.primary.withAlpha(40)),
                                      dataRowMaxHeight: 60,
                                      showBottomBorder: false,
                                      columns: [
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Name",
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Last Modified",
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Size",
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Owner",
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Members",
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Action",
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                      ],
                                      rows: [
                                        buildDataRows(
                                          "Flutter Design Files",
                                          DateTime.utc(2023, 1, 25),
                                          "Andrew",
                                          134217728,
                                          "Danielle Thompson",
                                          Icons.folder_outlined,
                                          [
                                            Images.avatars[0],
                                            Images.avatars[1],
                                            Images.avatars[2],
                                            Images.avatars[3],
                                          ],
                                        ),
                                        buildDataRows(
                                          "Sketch File",
                                          DateTime.utc(2020, 2, 13),
                                          "Getappui",
                                          546308096,
                                          "Coder Themes",
                                          Icons.insert_drive_file_outlined,
                                          [
                                            Images.avatars[0],
                                            Images.avatars[2],
                                            Images.avatars[3],
                                          ],
                                        ),
                                        buildDataRows(
                                          "WebUi Requirement.pdf",
                                          DateTime.utc(2020, 2, 13),
                                          "Alejandro",
                                          7549747,
                                          "Gary Coley",
                                          Icons.text_snippet_outlined,
                                          [
                                            Images.avatars[5],
                                            Images.avatars[4],
                                            Images.avatars[1],
                                          ],
                                        ),
                                        buildDataRows(
                                          "Wireframes",
                                          DateTime.utc(2023, 1, 25),
                                          "Dunkle",
                                          56832819,
                                          "Jasper Rigg",
                                          Icons.folder_outlined,
                                          [
                                            Images.avatars[0],
                                            Images.avatars[1],
                                            Images.avatars[2],
                                            Images.avatars[3],
                                          ],
                                        ),
                                        buildDataRows(
                                          "Documentation.docs",
                                          DateTime.utc(2020, 2, 13),
                                          "Justin",
                                          8703180,
                                          "Cooper Sharwood",
                                          Icons.text_snippet_outlined,
                                          [
                                            Images.avatars[4],
                                            Images.avatars[1],
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xxl-3 xl-4 lg-5 md-12 sm-12",
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: "lg-12 md-6",
                            child: MyCard(
                              shadow: MyShadow(
                                  elevation: 0.5,
                                  position: MyShadowPosition.bottom),
                              paddingAll: 0,
                              child: Padding(
                                padding: MySpacing.all(flexSpacing),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add),
                                          MySpacing.width(8),
                                          MyText.bodySmall(
                                            'Create New',
                                            color: contentTheme.onPrimary,
                                          ),
                                        ],
                                      ),
                                    ),
                                    MySpacing.height(24),
                                    buildCreateNew(
                                        "My File", Icons.folder_outlined),
                                    MySpacing.height(16),
                                    buildCreateNew(
                                        "Google Drive", Icons.add_to_drive),
                                    MySpacing.height(16),
                                    buildCreateNew("Share With Me",
                                        Icons.folder_shared_outlined),
                                    MySpacing.height(16),
                                    buildCreateNew(
                                        "Recent", Icons.access_time_outlined),
                                    MySpacing.height(16),
                                    buildCreateNew(
                                        "Starred", Icons.star_border),
                                    MySpacing.height(16),
                                    buildCreateNew("Delete File",
                                        Icons.auto_delete_outlined),
                                    MySpacing.height(40),
                                    MyText.bodySmall(
                                      "STORAGE",
                                      fontWeight: 700,
                                    ),
                                    MySpacing.height(14),
                                    MyProgressBar(
                                        width: 500,
                                        progress: 0.2,
                                        height: 3,
                                        radius: 4,
                                        inactiveColor: theme.dividerColor,
                                        activeColor: contentTheme.primary),
                                    MySpacing.height(14),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '7.02 GB ',
                                            style: MyTextStyle.bodyMedium(
                                              fontWeight: 700,
                                            ),
                                          ),
                                          TextSpan(
                                              text: '(46%) of  ',
                                              style: MyTextStyle.bodyMedium()),
                                          TextSpan(
                                            text: '15 GB',
                                            style: MyTextStyle.bodyMedium(
                                              fontWeight: 700,
                                            ),
                                          ),
                                          TextSpan(
                                              text: ' used',
                                              style: MyTextStyle.bodyMedium()),
                                        ],
                                      ),
                                    ),
                                    MySpacing.height(20),
                                    Center(
                                      child: MyButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        padding: MySpacing.xy(20, 16),
                                        borderColor: contentTheme.primary,
                                        backgroundColor:
                                            contentTheme.primary.withAlpha(28),
                                        splashColor:
                                            contentTheme.primary.withAlpha(28),
                                        borderRadiusAll: 20,
                                        child: MyText.bodyMedium(
                                          'UPGRADE',
                                          color: contentTheme.primary,
                                          fontWeight: 600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: "lg-12 md-6",
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleMedium('Storage'),
                                  MySpacing.height(12),
                                  SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      axes: <ChartAxis>[
                                        NumericAxis(
                                            numberFormat:
                                                NumberFormat.compact(),
                                            majorGridLines:
                                                const MajorGridLines(width: 0),
                                            opposedPosition: true,
                                            name: 'yAxis1',
                                            interval: 1000,
                                            minimum: 0,
                                            maximum: 7000)
                                      ],
                                      series: [
                                        ColumnSeries<ChartData, String>(
                                            color: contentTheme.primary,
                                            animationDuration: 2000,
                                            dataSource: controller.chartData,
                                            xValueMapper: (ChartData data, _) =>
                                                data.x,
                                            yValueMapper: (ChartData data, _) =>
                                                data.yValue1,
                                            name: 'Unit Sold'),
                                        LineSeries<ChartData, String>(
                                            animationDuration: 4500,
                                            animationDelay: 2000,
                                            dataSource: controller.chartData,
                                            xValueMapper: (ChartData data, _) =>
                                                data.x,
                                            yValueMapper: (ChartData data, _) =>
                                                data.yValue2,
                                            yAxisName: 'yAxis1',
                                            markerSettings:
                                                const MarkerSettings(
                                                    isVisible: true),
                                            name: 'Total Transaction')
                                      ]),
                                ],
                              ),
                            ),
                          ),
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

  buildCreateNew(String fileName, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
        ),
        MySpacing.width(16),
        MyText.bodyMedium(
          fileName,
          fontWeight: 600,
        ),
      ],
    );
  }

  buildDataRows(
    String name,
    DateTime modifyAt,
    String author,
    int bytes,
    String owner,
    IconData? icon,
    List<String> images,
  ) {
    return DataRow(
      cells: [
        DataCell(
          SizedBox(
            width: 250,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 22,
                ),
                MySpacing.width(16),
                MyText.bodyMedium(
                  name,
                  fontWeight: 600,
                ),
              ],
            ),
          ),
        ),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText.bodyMedium(
                '${Utils.getDateStringFromDateTime(modifyAt, showMonthShort: true)}',
              ),
              MyText.bodySmall(
                "by $author",
                muted: true,
              ),
            ],
          ),
        ),
        DataCell(
          MyText.bodyMedium(
            Utils.getStorageStringFromByte(bytes),
          ),
        ),
        DataCell(
          MyText.bodyMedium(owner),
        ),
        DataCell(
          SizedBox(
            width: 130,
            child: Stack(
                alignment: Alignment.centerRight,
                children: images
                    .mapIndexed((index, image) => Positioned(
                          left: (18 + (20 * index)).toDouble(),
                          child: MyContainer.rounded(
                            paddingAll: 2,
                            child: MyContainer.rounded(
                              bordered: true,
                              paddingAll: 0,
                              child: Image.asset(
                                image,
                                height: 28,
                                width: 28,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ))
                    .toList()),
          ),
        ),
        DataCell(MyContainer.none(
          paddingAll: 8,
          borderRadiusAll: 5,
          color: contentTheme.primary.withOpacity(0.05),
          child: PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      Icon(
                        Icons.share_outlined,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Share")
                    ],
                  )),
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      Icon(
                        Icons.link_outlined,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Get Sharable Link")
                    ],
                  )),
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      Icon(
                        Icons.create_outlined,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Rename")
                    ],
                  )),
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      Icon(
                        Icons.download_outlined,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Download")
                    ],
                  )),
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Remove")
                    ],
                  ))
            ],
            child: Icon(
              Icons.more_horiz_outlined,
              size: 18,
            ),
          ),
        )),
      ],
    );
  }

  Widget buildFile(IconData icon, String name, int bytes) {
    return MyContainer.bordered(
      paddingAll: 8,
      width: 220,
      child: Row(
        children: [
          MyContainer(
            color: contentTheme.onBackground.withAlpha(28),
            paddingAll: 8,
            child: Icon(
              icon,
              size: 20,
            ),
          ),
          MySpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: 600,
                ),
                MyText.bodySmall(Utils.getStorageStringFromByte(bytes)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
