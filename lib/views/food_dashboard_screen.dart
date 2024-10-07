import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:webui/controller/food_dashboard_controller.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class FoodDashboardScreen extends StatefulWidget {
  const FoodDashboardScreen({super.key});

  @override
  State<FoodDashboardScreen> createState() => _FoodDashboardScreenState();
}

class _FoodDashboardScreenState extends State<FoodDashboardScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late FoodDashboardController controller;
  late GoogleMapController mapController;

  @override
  void initState() {
    controller = Get.put(FoodDashboardController());
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
                      "Food",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Dashboard'),
                        MyBreadcrumbItem(name: 'Food', active: true),
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
                        child: MyFlex(contentPadding: false, children: [
                      MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: buildOverView(
                          'Total Earning',
                          '3.01%',
                          '\$15,000',
                          LucideIcons.chevron_up,
                          contentTheme.primary,
                        ),
                      ),
                      MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: buildOverView(
                          'Daily Sales',
                          '0.08%',
                          '\$20,000',
                          LucideIcons.chevron_up,
                          contentTheme.primary,
                        ),
                      ),
                      MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: buildOverView(
                          'Total Customer',
                          '1.00%',
                          '15',
                          LucideIcons.chevron_up,
                          contentTheme.primary,
                        ),
                      ),
                      MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: buildOverView(
                          'New Customer',
                          '1.00%',
                          '2',
                          LucideIcons.chevron_down,
                          contentTheme.red,
                        ),
                      ),
                    ])),
                    MyFlexItem(
                      child: MyFlex(contentPadding: false, children: [
                        MyFlexItem(
                          sizes: 'lg-9',
                          child: MyContainer(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText.bodyMedium(
                                      "Summary",
                                      fontWeight: 600,
                                    ),
                                    PopupMenuButton(
                                      onSelected:
                                          controller.onSelectedOrderRequest,
                                      itemBuilder: (BuildContext context) {
                                        return [
                                          "Year",
                                          "Month",
                                          "Week",
                                          "Day",
                                          "Hours"
                                        ].map((behavior) {
                                          return PopupMenuItem(
                                            value: behavior,
                                            height: 32,
                                            child: MyText.bodySmall(
                                              behavior.toString(),
                                              color:
                                                  theme.colorScheme.onSurface,
                                              fontWeight: 600,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      color: theme.cardTheme.color,
                                      child: MyContainer(
                                        padding: MySpacing.xy(12, 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            MyText.labelMedium(
                                              controller.selectedOrder
                                                  .toString(),
                                              color:
                                                  theme.colorScheme.onSurface,
                                            ),
                                            Icon(
                                              LucideIcons.chevron_down,
                                              size: 22,
                                              color:
                                                  theme.colorScheme.onSurface,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                MySpacing.height(16),
                                SizedBox(
                                  height: 300,
                                  child: LineChart(controller.mainData(),
                                      duration: Duration(milliseconds: 600)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MyFlexItem(
                          sizes: 'lg-3',
                          child: MyContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodyMedium(
                                  "Total Sales",
                                  fontWeight: 600,
                                ),
                                SizedBox(
                                    height: 335,
                                    child: _buildAngleRadialBarChart()),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    MyFlexItem(
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: 'lg-6',
                            child: MyContainer(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText.bodyMedium(
                                        'Top Selling Dish',
                                        fontWeight: 600,
                                      ),
                                      MyText.bodyMedium(
                                        'View All',
                                        fontWeight: 600,
                                        xMuted: true,
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(20),
                                  MyFlex(contentPadding: false, children: [
                                    MyFlexItem(
                                      sizes: 'lg-6 md-6',
                                      child: buildTopSellingDish(
                                        'assets/images/food/pizza.jpg',
                                        'Pizza',
                                        '120',
                                      ),
                                    ),
                                    MyFlexItem(
                                      sizes: 'lg-6 md-6',
                                      child: buildTopSellingDish(
                                        'assets/images/food/waffles.jpg',
                                        'Waffles',
                                        '40',
                                      ),
                                    ),
                                  ]),
                                  MySpacing.height(20),
                                  MyFlex(contentPadding: false, children: [
                                    MyFlexItem(
                                      sizes: 'lg-6 md-6',
                                      child: buildTopSellingDish(
                                        'assets/images/food/burger_chicken.jpg',
                                        'Burger Chicken',
                                        '8',
                                      ),
                                    ),
                                    MyFlexItem(
                                      sizes: 'lg-6 md-6',
                                      child: buildTopSellingDish(
                                        'assets/images/food/humburger.jpg',
                                        'Humburger',
                                        '50',
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-6',
                            child: MyContainer(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText.bodyMedium(
                                        'Out of Stock',
                                        fontWeight: 600,
                                      ),
                                      MyText.bodyMedium(
                                        'View All',
                                        fontWeight: 600,
                                        xMuted: true,
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(20),
                                  MyFlex(contentPadding: false, children: [
                                    MyFlexItem(
                                      sizes: 'lg-6 md-6',
                                      child: buildTopSellingDish(
                                        'assets/images/food/chicken.jpg',
                                        'Chicken',
                                        'in 30 Minutes',
                                      ),
                                    ),
                                    MyFlexItem(
                                      sizes: 'lg-6 md-6',
                                      child: buildTopSellingDish(
                                        'assets/images/food/american_favourite.jpg',
                                        'American Favourite',
                                        'in 10 Minutes',
                                      ),
                                    ),
                                  ]),
                                  MySpacing.height(20),
                                  MyFlex(contentPadding: false, children: [
                                    MyFlexItem(
                                      sizes: 'lg-6 md-6',
                                      child: buildTopSellingDish(
                                        'assets/images/food/samosa.jpg',
                                        'Samosa',
                                        'Tomorrow',
                                      ),
                                    ),
                                    MyFlexItem(
                                      sizes: 'lg-6 md-6',
                                      child: buildTopSellingDish(
                                        'assets/images/food/chapman.jpg',
                                        'ChapMan',
                                        'Tomorrow',
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                              sizes: 'lg-6',
                              child: MyContainer(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText.bodyMedium(
                                            'Recent Order Request'),
                                        PopupMenuButton(
                                          onSelected:
                                              controller.onSelectedOrderRequest,
                                          itemBuilder: (BuildContext context) {
                                            return [
                                              "Year",
                                              "Month",
                                              "Week",
                                              "Day",
                                              "Hours"
                                            ].map((behavior) {
                                              return PopupMenuItem(
                                                value: behavior,
                                                height: 32,
                                                child: MyText.bodySmall(
                                                  behavior.toString(),
                                                  color: theme
                                                      .colorScheme.onSurface,
                                                  fontWeight: 600,
                                                ),
                                              );
                                            }).toList();
                                          },
                                          color: theme.cardTheme.color,
                                          child: MyContainer(
                                            padding: MySpacing.xy(12, 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                MyText.labelMedium(
                                                  controller.selectedOrder
                                                      .toString(),
                                                  color: theme
                                                      .colorScheme.onSurface,
                                                ),
                                                Icon(
                                                  LucideIcons.chevron_down,
                                                  size: 22,
                                                  color: theme
                                                      .colorScheme.onSurface,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 300,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: controller.food.length,
                                        itemBuilder: (context, index) {
                                          return Wrap(
                                            spacing: 20,
                                            runSpacing: 12,
                                            children: [
                                              MyContainer(
                                                height: 64,
                                                width: 100,
                                                paddingAll: 0,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.network(
                                                  controller.food[index].image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 300,
                                                child: MyText.bodyMedium(
                                                  controller
                                                      .food[index].foodName,
                                                  fontWeight: 600,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    MyText.bodyMedium(
                                                      controller.food[index]
                                                          .customerName,
                                                      fontWeight: 600,
                                                    ),
                                                    MyText.bodyMedium(
                                                      controller
                                                          .food[index].address,
                                                      fontWeight: 600,
                                                      muted: true,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: MyContainer(
                                                  paddingAll: 0,
                                                  height: 40,
                                                  width: 80,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: controller.food[index]
                                                              .pending ==
                                                          false
                                                      ? contentTheme.red
                                                          .withAlpha(40)
                                                      : contentTheme.success
                                                          .withAlpha(40),
                                                  child: Center(
                                                    child: MyText.bodyMedium(
                                                      controller.food[index]
                                                                  .pending ==
                                                              false
                                                          ? 'Pending'
                                                          : 'Delivered',
                                                      fontWeight: 600,
                                                      color: controller
                                                                  .food[index]
                                                                  .pending ==
                                                              false
                                                          ? contentTheme.red
                                                          : contentTheme
                                                              .success,
                                                    ),
                                                  ),
                                                ),
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
                                    )
                                  ],
                                ),
                              )),
                          MyFlexItem(
                              sizes: 'lg-6',
                              child: MyContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText.bodyMedium('Delivery Map'),
                                        PopupMenuButton(
                                          onSelected:
                                              controller.onSelectedOrderMap,
                                          itemBuilder: (BuildContext context) {
                                            return [
                                              "Year",
                                              "Month",
                                              "Week",
                                              "Day",
                                              "Hours"
                                            ].map((behavior) {
                                              return PopupMenuItem(
                                                value: behavior,
                                                height: 32,
                                                child: MyText.bodySmall(
                                                  behavior.toString(),
                                                  color: theme
                                                      .colorScheme.onSurface,
                                                  fontWeight: 600,
                                                ),
                                              );
                                            }).toList();
                                          },
                                          color: theme.cardTheme.color,
                                          child: MyContainer(
                                            padding: MySpacing.xy(12, 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                MyText.labelMedium(
                                                  controller.orderMap
                                                      .toString(),
                                                  color: theme
                                                      .colorScheme.onSurface,
                                                ),
                                                Icon(
                                                  LucideIcons.chevron_down,
                                                  size: 22,
                                                  color: theme
                                                      .colorScheme.onSurface,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 300,
                                      child: SfMaps(
                                        layers: [
                                          MapShapeLayer(
                                            source: controller.dataSource,
                                            sublayers: [
                                              MapPolylineLayer(
                                                polylines:
                                                    List<MapPolyline>.generate(
                                                  controller.polylines.length,
                                                  (int index) {
                                                    return MapPolyline(
                                                        points: controller
                                                            .polylines[index]
                                                            .points,
                                                        color: controller
                                                                    .selectedIndex ==
                                                                index
                                                            ? Colors.pink
                                                            : Colors.blue,
                                                        onTap: () {
                                                          setState(() {
                                                            controller
                                                                    .selectedIndex =
                                                                index;
                                                          });
                                                        });
                                                  },
                                                ).toSet(),
                                              ),
                                            ],
                                            zoomPanBehavior:
                                                controller.zoomPanBehavior,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
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

  Widget buildTopSellingDish(
      String image, String orderName, String orderCount) {
    return SizedBox(
      width: 300,
      child: Row(
        children: [
          MyContainer(
            borderRadiusAll: 8,
            paddingAll: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 50,
            width: 50,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          MySpacing.width(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  orderName,
                  fontWeight: 600,
                ),
                MyText.bodyMedium(
                  'Order: $orderCount',
                  fontWeight: 600,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SfCircularChart _buildAngleRadialBarChart() {
    return SfCircularChart(
      legend: Legend(
          isVisible: true,
          iconHeight: 20,
          iconWidth: 20,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.none),
      series: controller.getRadialBarSeries(),
    );
  }

  Widget buildOverView(
      String title, String rank, String price, IconData icon, Color color) {
    return MyContainer(
      height: 150,
      width: 391,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                title,
                fontWeight: 600,
              ),
              Row(
                children: [
                  Icon(icon, size: 20, color: color),
                  MyText.bodyMedium(rank, color: color, fontWeight: 600),
                ],
              ),
            ],
          ),
          MyText.bodyLarge(
            price,
            fontSize: 24,
            fontWeight: 600,
          )
        ],
      ),
    );
  }
}
