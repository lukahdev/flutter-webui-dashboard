import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/ui/notification_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late NotificationController controller;

  @override
  void initState() {
    controller = Get.put(NotificationController(this));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: GetBuilder<NotificationController>(
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
                          "notifications".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        MyBreadcrumb(
                          children: [
                            MyBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                            MyBreadcrumbItem(
                                name: 'notifications'.tr(), active: true),
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
                            sizes: "lg-8 md-12",
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              paddingAll: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    color:
                                        contentTheme.primary.withOpacity(0.08),
                                    padding: MySpacing.xy(flexSpacing, 12),
                                    child: MyText.titleMedium(
                                      "${controller.showBanner ? "banner".tr() : "toast".tr()} Customizer",
                                      fontWeight: 600,
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  Padding(
                                      padding: MySpacing.xy(flexSpacing, 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText.labelLarge(
                                            "type".tr(),
                                          ),
                                          MySpacing.height(8),
                                          Wrap(
                                            spacing: 16,
                                            runSpacing: 4,
                                            children: [
                                              InkWell(
                                                onTap: () => controller
                                                    .setBannerType(false),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Radio<bool>(
                                                      value: false,
                                                      activeColor:
                                                          contentTheme.primary,
                                                      groupValue:
                                                          controller.showBanner,
                                                      onChanged: (_) =>
                                                          controller
                                                              .setBannerType(
                                                                  false),
                                                      visualDensity:
                                                          getCompactDensity,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                    MySpacing.width(8),
                                                    MyText.labelMedium(
                                                        "toast".tr())
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () => controller
                                                    .setBannerType(true),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Radio<bool>(
                                                      value: true,
                                                      activeColor:
                                                          contentTheme.primary,
                                                      groupValue:
                                                          controller.showBanner,
                                                      onChanged: (_) =>
                                                          controller
                                                              .setBannerType(
                                                                  true),
                                                      visualDensity:
                                                          getCompactDensity,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                    MySpacing.width(8),
                                                    MyText.labelMedium(
                                                        "banner".tr())
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          MySpacing.height(20),
                                          MyText.labelLarge(
                                            "title_text".tr().capitalizeWords,
                                          ),
                                          MySpacing.height(8),
                                          TextFormField(
                                            controller:
                                                controller.toastTitleController,
                                            decoration: InputDecoration(
                                                labelText: "toast_text"
                                                    .tr()
                                                    .capitalizeWords,

                                                // border: outlineInputBorder,
                                                // enabledBorder: outlineInputBorder,

                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .never),
                                          ),
                                          MySpacing.height(20),
                                          MyText.labelLarge(
                                            "color_variant"
                                                .tr()
                                                .capitalizeWords,
                                          ),
                                          MySpacing.height(8),
                                          Wrap(
                                              spacing: 16,
                                              runSpacing: 4,
                                              children: ContentThemeColor.values
                                                  .map(
                                                    (color) => InkWell(
                                                      onTap: () => controller
                                                          .onChangeColor(color),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Radio<
                                                              ContentThemeColor>(
                                                            value: color,
                                                            activeColor:
                                                                controller
                                                                    .selectedColor
                                                                    .color,
                                                            groupValue: controller
                                                                .selectedColor,
                                                            onChanged: controller
                                                                .onChangeColor,
                                                            visualDensity:
                                                                getCompactDensity,
                                                            materialTapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .shrinkWrap,
                                                          ),
                                                          MySpacing.width(8),
                                                          MyText.labelMedium(color
                                                              .name
                                                              .capitalizeWords)
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  .toList()),
                                          MySpacing.height(20),
                                          if (!controller.showBanner) ...[
                                            MyText.labelLarge(
                                              "floating_type"
                                                  .tr()
                                                  .capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            Wrap(
                                                spacing: 16,
                                                children: SnackBarBehavior
                                                    .values
                                                    .map(
                                                      (behavior) => InkWell(
                                                        onTap: () => controller
                                                            .onChangeBehavior(
                                                                behavior),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Radio<
                                                                SnackBarBehavior>(
                                                              value: behavior,
                                                              activeColor:
                                                                  contentTheme
                                                                      .primary,
                                                              groupValue: controller
                                                                  .selectedBehavior,
                                                              onChanged: controller
                                                                  .onChangeBehavior,
                                                              visualDensity:
                                                                  getCompactDensity,
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                            ),
                                                            MySpacing.width(8),
                                                            MyText.labelMedium(
                                                                behavior.name
                                                                    .capitalizeWords)
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .toList()),
                                            MySpacing.height(20),
                                          ],
                                          MyText.labelLarge(
                                            "actions".tr(),
                                          ),
                                          MySpacing.height(8),
                                          CheckboxListTile(
                                              value: controller.showCloseIcon,
                                              onChanged: controller
                                                  .onChangeShowCloseIcon,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              visualDensity: getCompactDensity,
                                              contentPadding: MySpacing.zero,
                                              dense: true,
                                              title: MyText.bodyMedium(
                                                  "show_close_icon"
                                                      .tr()
                                                      .capitalizeWords)),
                                          if (!controller.showBanner)
                                            CheckboxListTile(
                                                value: controller.showOkAction,
                                                onChanged: controller
                                                    .onChangeShowOkAction,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                visualDensity:
                                                    getCompactDensity,
                                                contentPadding: MySpacing.zero,
                                                dense: true,
                                                title: MyText.bodyMedium(
                                                    "show_ok_action"
                                                        .tr()
                                                        .capitalizeWords)),
                                          if (controller.showBanner)
                                            CheckboxListTile(
                                                value:
                                                    controller.showLeadingIcon,
                                                onChanged: controller
                                                    .onChangeShowLeadingIcon,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                visualDensity:
                                                    getCompactDensity,
                                                contentPadding: MySpacing.zero,
                                                dense: true,
                                                title: MyText.bodyMedium(
                                                    "show_leading_icon"
                                                        .tr()
                                                        .capitalizeWords)),
                                          MySpacing.height(20),
                                          MyText.labelLarge(
                                            "timeout".tr(),
                                          ),
                                          MySpacing.height(8),
                                          SwitchListTile(
                                              value: controller.sticky,
                                              onChanged:
                                                  controller.onChangeSticky,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              visualDensity: getCompactDensity,
                                              contentPadding: MySpacing.zero,
                                              dense: true,
                                              title: MyText.bodyMedium(
                                                  "${"infinite".tr()} (∞)")),
                                          MySpacing.height(20),
                                          Center(
                                            child: MyButton(
                                              onPressed: controller.show,
                                              elevation: 0,
                                              padding: MySpacing.xy(20, 16),
                                              backgroundColor:
                                                  contentTheme.primary,
                                              borderRadiusAll:
                                                  AppStyle.buttonRadius.medium,
                                              child: MyText.bodySmall(
                                                'show'.tr(),
                                                color: contentTheme.onPrimary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
