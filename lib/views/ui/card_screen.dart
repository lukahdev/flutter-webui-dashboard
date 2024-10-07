import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/ui/card_controller.dart';
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
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/layout.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late CardController controller;

  @override
  void initState() {
    controller = Get.put(CardController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<CardController>(
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
                      "cards".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                        MyBreadcrumbItem(name: 'cards'.tr(), active: true),
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
                      child: MyContainer(
                        paddingAll: 0,
                        height: 250,
                        child: buildCardDetails('Simple Card'),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-3',
                      child: MyContainer(
                          paddingAll: 0,
                          height: 250,
                          color: contentTheme.info.withAlpha(100),
                          child: buildCardDetails('Color Card')),
                    ),
                    MyFlexItem(
                      sizes: 'lg-3',
                      child: MyCard(
                        paddingAll: 0,
                        height: 250,
                        child: buildCardDetails('Elevation Card'),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-3',
                      child: MyContainer.bordered(
                        paddingAll: 0,
                        height: 250,
                        child: buildCardDetails('Card Bordered'),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-3',
                      child: MyContainer(
                        borderRadiusAll: 12,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyCard(
                              height: 200,
                              width: double.infinity,
                              paddingAll: 0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadiusAll: 8,
                              child: Image.asset(
                                Images.landscapeImages[1],
                                fit: BoxFit.cover,
                              ),
                            ),
                            MySpacing.height(12),
                            MyText.titleMedium(
                              'Card Image',
                              fontWeight: 600,
                            ),
                            MySpacing.height(12),
                            MyText.bodyMedium(
                              controller.dummyTexts[5],
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-3',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.titleMedium(
                            'Card Blog',
                            fontWeight: 600,
                          ),
                          MySpacing.height(12),
                          MyCard(
                            height: 200,
                            width: double.infinity,
                            paddingAll: 0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.landscapeImages[2],
                              fit: BoxFit.cover,
                            ),
                          ),
                          MySpacing.height(12),
                          MyText.bodyMedium(
                            controller.dummyTexts[5],
                            maxLines: 4,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-6',
                      child: MyContainer(
                        paddingAll: 0,
                        child: Row(
                          children: [
                            Padding(
                              padding: MySpacing.nRight(20),
                              child: MyCard(
                                height: 300,
                                width: 350,
                                paddingAll: 0,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset(
                                  Images.landscapeImages[3],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: MySpacing.x(16),
                                    child: MyText.titleMedium(
                                      'Card Horizontal',
                                      fontWeight: 600,
                                      muted: true,
                                    ),
                                  ),
                                  Divider(
                                    height: 24,
                                  ),
                                  Padding(
                                    padding: MySpacing.x(16),
                                    child: MyText.bodyMedium(
                                      controller.dummyTexts[5],
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing * 2),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  wrapAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  children: [
                    MyFlexItem(
                      sizes: "xl-6 sm-12",
                      child: MyContainer(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        paddingAll: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyContainer(
                              child: MyText.titleMedium(
                                "card_customizer".tr().capitalizeWords,
                                fontWeight: 600,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Padding(
                              padding: MySpacing.xy(flexSpacing, 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        child: MyText.bodyMedium(
                                          "shadow_position"
                                              .tr()
                                              .capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      PopupMenuButton(
                                          key: controller.shadowPositionKey,
                                          onSelected:
                                              controller.onChangePosition,
                                          itemBuilder: (BuildContext context) {
                                            return MyShadowPosition.values
                                                .map((position) {
                                              return PopupMenuItem(
                                                value: position,
                                                height: 32,
                                                child: MyText.bodySmall(
                                                  position.humanReadable,
                                                  color: theme
                                                      .colorScheme.onSurface,
                                                  fontWeight: 600,
                                                ),
                                              );
                                            }).toList();
                                          },
                                          color: theme.cardTheme.color,
                                          child: MyContainer.bordered(
                                            padding: MySpacing.xy(12, 8),
                                            child: Row(
                                              children: <Widget>[
                                                MyText.labelMedium(
                                                  controller.shadowPosition
                                                      .humanReadable,
                                                  color: theme
                                                      .colorScheme.onSurface,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 4),
                                                  child: Icon(
                                                    LucideIcons.chevron_down,
                                                    size: 22,
                                                    color: theme
                                                        .colorScheme.onSurface,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  MySpacing.height(8),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: MyText.bodyMedium(
                                          "shadow_size".tr().capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      Slider(
                                        value: controller.shadowElevation,
                                        min: 0,
                                        max: 40,
                                        divisions: 40,
                                        label: controller.shadowElevation
                                            .floor()
                                            .toString(),
                                        onChanged: controller.onChangeElevation,
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(12),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: MyText.bodyMedium(
                                          "shadow_color".tr().capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      BlockPicker(
                                        pickerColor: controller.shadowColor,
                                        onColorChanged:
                                            controller.onChangeColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                        sizes: "xl-4 md-6 sm-12",
                        child: Padding(
                          padding: MySpacing.x(40),
                          child: MyCard(
                            padding: MySpacing.zero,
                            shadow: MyShadow(
                              elevation: controller.shadowElevation,
                              position: controller.shadowPosition,
                              color: controller.shadowColor.withAlpha(100),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: MySpacing.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText.titleMedium(
                                        'result'.tr(),
                                        fontWeight: 600,
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  Images.squareImages[12],
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: MySpacing.all(16),
                                  child: MyText.bodySmall(
                                    controller.dummyTexts[7],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildCardDetails(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: MySpacing.only(left: 16, top: 12),
          child: MyText.titleMedium(
            title,
            fontWeight: 600,
          ),
        ),
        Divider(
          height: 24,
        ),
        Expanded(
          child: Padding(
            padding: MySpacing.only(bottom: 12, left: 16),
            child: MyText.bodyMedium(
              controller.dummyTexts[4],
              fontWeight: 600,
              muted: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }
}
