import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/ui/tab_bar_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_tab_indicator_style.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with TickerProviderStateMixin, UIMixin {
  late TabBarController controller;

  @override
  void initState() {
    controller = Get.put(TabBarController(this));
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
                      "tabs".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                        MyBreadcrumbItem(name: 'tabs'.tr(), active: true),
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
                        sizes: "lg-6 md-12",
                        child: MyCard(
                            paddingAll: 0,
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: MySpacing.only(left: 16, top: 12),
                                  child: MyText.titleMedium(
                                    "default_tabs".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                ),
                                Divider(
                                  height: 20,
                                ),
                                Padding(
                                  padding: MySpacing.only(left: 16, bottom: 12),
                                  child: TabBar(
                                    controller: controller.defaultTabController,
                                    isScrollable: true,
                                    tabs: [
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.defaultIndex == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.defaultIndex == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.defaultIndex == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.defaultIndex == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.defaultIndex == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.defaultIndex == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 12),
                                    child: TabBarView(
                                      controller:
                                          controller.defaultTabController,
                                      children: [
                                        MyText.bodySmall(
                                            controller.dummyTexts[0]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[1]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                    MyFlexItem(
                        sizes: "lg-6 md-12",
                        child: MyCard(
                            paddingAll: 0,
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: MySpacing.only(left: 16, top: 12),
                                  child: MyText.titleMedium(
                                    "full_width".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                ),
                                Divider(
                                  height: 28,
                                ),
                                Padding(
                                  padding: MySpacing.only(left: 16, bottom: 12),
                                  child: TabBar(
                                    controller:
                                        controller.fullWidthTabController,
                                    tabs: [
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.fullWidthIndex == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.fullWidthIndex == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.fullWidthIndex == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.fullWidthIndex == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.fullWidthIndex == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.fullWidthIndex == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                ),
                                MySpacing.height(16),
                                SizedBox(
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 12),
                                    child: TabBarView(
                                      controller:
                                          controller.fullWidthTabController,
                                      children: [
                                        MyText.bodySmall(
                                            controller.dummyTexts[0]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[1]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                    MyFlexItem(
                        sizes: "lg-6 md-12",
                        child: MyCard(
                            paddingAll: 0,
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: MySpacing.only(left: 16, top: 12),
                                  child: MyText.titleMedium(
                                    "background_indicator".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                ),
                                Divider(
                                  height: 28,
                                ),
                                Padding(
                                  padding: MySpacing.only(left: 16, bottom: 12),
                                  child: TabBar(
                                    controller:
                                        controller.backgroundTabController,
                                    isScrollable: true,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: contentTheme.primary),
                                    tabs: [
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.backgroundIndex == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.backgroundIndex == 0
                                              ? contentTheme.onPrimary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.backgroundIndex == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.backgroundIndex == 1
                                              ? contentTheme.onPrimary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.backgroundIndex == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.backgroundIndex == 2
                                              ? contentTheme.onPrimary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                ),
                                MySpacing.height(16),
                                SizedBox(
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 12),
                                    child: TabBarView(
                                      controller:
                                          controller.backgroundTabController,
                                      children: [
                                        MyText.bodySmall(
                                            controller.dummyTexts[0]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[1]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                    MyFlexItem(
                        sizes: "lg-6 md-12",
                        child: MyCard(
                            paddingAll: 0,
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: MySpacing.only(left: 16, top: 12),
                                  child: MyText.titleMedium(
                                    "bordered_indicator".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                ),
                                Divider(
                                  height: 28,
                                ),
                                Padding(
                                  padding: MySpacing.only(left: 16, bottom: 12),
                                  child: TabBar(
                                    controller:
                                        controller.borderedTabController,
                                    isScrollable: true,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            color: contentTheme.primary,
                                            width: 1.2)),
                                    tabs: [
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.borderedIndex == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.borderedIndex == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.borderedIndex == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.borderedIndex == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.borderedIndex == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.borderedIndex == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                ),
                                MySpacing.height(16),
                                SizedBox(
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 12),
                                    child: TabBarView(
                                      controller:
                                          controller.borderedTabController,
                                      children: [
                                        MyText.bodySmall(
                                            controller.dummyTexts[0]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[1]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                    MyFlexItem(
                        sizes: "lg-6 md-12",
                        child: MyCard(
                            paddingAll: 0,
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: MySpacing.only(left: 16, top: 12),
                                  child: MyText.titleMedium(
                                    "soft_indicator".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                ),
                                Divider(
                                  height: 28,
                                ),
                                Padding(
                                  padding: MySpacing.only(left: 16, bottom: 12),
                                  child: TabBar(
                                    controller: controller.softTabController,
                                    isScrollable: true,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color:
                                            contentTheme.primary.withAlpha(40)),
                                    tabs: [
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "home".tr(),
                                          fontWeight: controller.softIndex == 0
                                              ? 600
                                              : 500,
                                          color: controller.softIndex == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight: controller.softIndex == 1
                                              ? 600
                                              : 500,
                                          color: controller.softIndex == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight: controller.softIndex == 2
                                              ? 600
                                              : 500,
                                          color: controller.softIndex == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                ),
                                MySpacing.height(16),
                                SizedBox(
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 12),
                                    child: TabBarView(
                                      controller: controller.softTabController,
                                      children: [
                                        MyText.bodySmall(
                                            controller.dummyTexts[0]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[1]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                    MyFlexItem(
                        sizes: "lg-6 md-12",
                        child: MyCard(
                            paddingAll: 0,
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: MySpacing.only(left: 16, top: 12),
                                  child: MyText.titleMedium(
                                    "${"custom_indicator".tr()} #1",
                                    fontWeight: 600,
                                  ),
                                ),
                                Divider(
                                  height: 28,
                                ),
                                Padding(
                                  padding: MySpacing.only(left: 16, bottom: 12),
                                  child: TabBar(
                                    controller: controller.customTabController1,
                                    isScrollable: true,
                                    indicator: MyTabIndicator(
                                      indicatorColor: contentTheme.primary,
                                      indicatorStyle:
                                          MyTabIndicatorStyle.rectangle,
                                      yOffset: 40,
                                    ),
                                    tabs: [
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.customIndex1 == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.customIndex1 == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.customIndex1 == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.customIndex1 == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.customIndex1 == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.customIndex1 == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                ),
                                MySpacing.height(16),
                                SizedBox(
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 12),
                                    child: TabBarView(
                                      controller:
                                          controller.customTabController1,
                                      children: [
                                        MyText.bodySmall(
                                            controller.dummyTexts[0]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[1]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                    MyFlexItem(
                        sizes: "lg-6 md-12",
                        child: MyCard(
                            paddingAll: 0,
                            child: Column(
                              children: [
                                Padding(
                                  padding: MySpacing.only(left: 16, top: 12),
                                  child: MyText.titleMedium(
                                    "Custom Indicator #2",
                                    fontWeight: 600,
                                  ),
                                ),
                                const Divider(
                                  height: 28,
                                ),
                                Padding(
                                  padding: MySpacing.only(left: 16, bottom: 12),
                                  child: TabBar(
                                    controller: controller.customTabController2,
                                    isScrollable: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    indicator: MyTabIndicator(
                                        indicatorColor: contentTheme.primary,
                                        indicatorStyle:
                                            MyTabIndicatorStyle.circle,
                                        yOffset: 40),
                                    tabs: [
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "Home",
                                          fontWeight:
                                              controller.customIndex2 == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.customIndex2 == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "Profile",
                                          fontWeight:
                                              controller.customIndex2 == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.customIndex2 == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: MyText.bodyMedium(
                                          "Messages",
                                          fontWeight:
                                              controller.customIndex2 == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.customIndex2 == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                ),
                                MySpacing.height(16),
                                SizedBox(
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 12),
                                    child: TabBarView(
                                      controller:
                                          controller.customTabController2,
                                      children: [
                                        MyText.bodySmall(
                                            controller.dummyTexts[0]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[1]),
                                        MyText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
