import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/ui/buttons_controller.dart';
import 'package:webui/helper/extensions/string.dart';
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

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ButtonsController controller;

  @override
  void initState() {
    controller = Get.put(ButtonsController());
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
                      "buttons".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                        MyBreadcrumbItem(name: 'buttons'.tr(), active: true),
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
                                  'elevated_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.secondary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.onSecondary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.success,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.onSuccess,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.warning,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.onWarning,
                                        fontWeight: 600,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.info,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'info'.tr(),
                                        color: contentTheme.onInfo,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.danger,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.onDanger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'elevated_rounded_button'
                                      .tr()
                                      .capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.secondary,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.onSecondary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.success,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.onSuccess,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.warning,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.onWarning,
                                        fontWeight: 600,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.info,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'info'.tr(),
                                        color: contentTheme.onInfo,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.danger,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.onDanger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'flat_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.secondary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.onSecondary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.success,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.onSuccess,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.warning,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.onWarning,
                                        fontWeight: 600,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.info,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'info'.tr(),
                                        color: contentTheme.onInfo,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.danger,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.onDanger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'rounded_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      // padding: MySpacing.xy(12, 8),

                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.secondary,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.onSecondary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.success,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.onSuccess,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.warning,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.onWarning,
                                        fontWeight: 600,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.info,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'info'.tr(),
                                        color: contentTheme.onInfo,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.danger,
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.onDanger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'outline_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.primary,
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.1),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.secondary,
                                      splashColor: contentTheme.secondary
                                          .withOpacity(0.1),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.success,
                                      splashColor:
                                          contentTheme.success.withOpacity(0.1),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.success,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.warning,
                                      splashColor:
                                          contentTheme.warning.withOpacity(0.1),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.warning,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.info,
                                      splashColor:
                                          contentTheme.info.withOpacity(0.1),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'info'.tr(),
                                        color: contentTheme.info,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.danger,
                                      splashColor:
                                          contentTheme.danger.withOpacity(0.1),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.danger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'outline_rounded_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.primary,
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.1),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.secondary,
                                      splashColor: contentTheme.secondary
                                          .withOpacity(0.1),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.success,
                                      splashColor:
                                          contentTheme.success.withOpacity(0.1),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.success,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.warning,
                                      splashColor:
                                          contentTheme.warning.withOpacity(0.1),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.warning,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.info,
                                      splashColor:
                                          contentTheme.info.withOpacity(0.1),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'info'.tr(),
                                        color: contentTheme.info,
                                      ),
                                    ),
                                    MyButton.outlined(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.danger,
                                      splashColor:
                                          contentTheme.danger.withOpacity(0.1),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.danger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'soft_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.primary,
                                      backgroundColor: contentTheme.primary
                                          .withOpacity(0.12),
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.secondary,
                                      backgroundColor: contentTheme.secondary
                                          .withOpacity(0.12),
                                      splashColor: contentTheme.secondary
                                          .withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.success,
                                      backgroundColor: contentTheme.success
                                          .withOpacity(0.12),
                                      splashColor:
                                          contentTheme.success.withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.success,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.warning,
                                      backgroundColor: contentTheme.warning
                                          .withOpacity(0.12),
                                      splashColor:
                                          contentTheme.warning.withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.warning,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.info,
                                      backgroundColor:
                                          contentTheme.info.withOpacity(0.12),
                                      splashColor:
                                          contentTheme.info.withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'info'.tr(),
                                        color: contentTheme.info,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.danger,
                                      backgroundColor:
                                          contentTheme.danger.withOpacity(0.12),
                                      splashColor:
                                          contentTheme.danger.withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.danger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'soft_rounded_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.primary,
                                      backgroundColor: contentTheme.primary
                                          .withOpacity(0.12),
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.2),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.secondary,
                                      backgroundColor: contentTheme.secondary
                                          .withOpacity(0.12),
                                      splashColor: contentTheme.secondary
                                          .withOpacity(0.2),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.success,
                                      backgroundColor: contentTheme.success
                                          .withOpacity(0.12),
                                      splashColor:
                                          contentTheme.success.withOpacity(0.2),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.success,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.warning,
                                      backgroundColor: contentTheme.warning
                                          .withOpacity(0.12),
                                      splashColor:
                                          contentTheme.warning.withOpacity(0.2),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.warning,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.info,
                                      backgroundColor:
                                          contentTheme.info.withOpacity(0.12),
                                      splashColor:
                                          contentTheme.info.withOpacity(0.2),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'info'.tr(),
                                        color: contentTheme.info,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.danger,
                                      backgroundColor:
                                          contentTheme.danger.withOpacity(0.12),
                                      splashColor:
                                          contentTheme.danger.withOpacity(0.2),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.danger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'text_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton.text(
                                      onPressed: () {},
                                      elevation: 6,
                                      padding: MySpacing.xy(20, 16),
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      splashColor: contentTheme.secondary
                                          .withOpacity(0.1),
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      splashColor:
                                          contentTheme.success.withOpacity(0.1),
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.success,
                                      ),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      splashColor:
                                          contentTheme.warning.withOpacity(0.1),
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.warning,
                                      ),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      splashColor:
                                          contentTheme.info.withOpacity(0.1),
                                      child: MyText.bodySmall('Info',
                                          color: contentTheme.info),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      splashColor:
                                          contentTheme.danger.withOpacity(0.1),
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.danger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'text_rounded_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'primary'.tr(),
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      borderRadiusAll: 20,
                                      splashColor: contentTheme.secondary
                                          .withOpacity(0.1),
                                      child: MyText.bodySmall(
                                        'secondary'.tr(),
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      borderRadiusAll: 20,
                                      splashColor:
                                          contentTheme.success.withOpacity(0.1),
                                      child: MyText.bodySmall(
                                        'success'.tr(),
                                        color: contentTheme.success,
                                      ),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      borderRadiusAll: 20,
                                      splashColor:
                                          contentTheme.warning.withOpacity(0.1),
                                      child: MyText.bodySmall(
                                        'warning'.tr(),
                                        color: contentTheme.warning,
                                      ),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      borderRadiusAll: 20,
                                      splashColor:
                                          contentTheme.info.withOpacity(0.1),
                                      child: MyText.bodySmall(
                                        'info'.tr(),
                                        color: contentTheme.info,
                                      ),
                                    ),
                                    MyButton.text(
                                      onPressed: () {},
                                      padding: MySpacing.xy(20, 16),
                                      borderRadiusAll: 20,
                                      splashColor:
                                          contentTheme.danger.withOpacity(0.1),
                                      child: MyText.bodySmall(
                                        'danger'.tr(),
                                        color: contentTheme.danger,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                  'sized_button'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                ),
                              ),
                              Divider(
                                height: 32,
                              ),
                              Padding(
                                padding: MySpacing.only(left: 16, bottom: 12),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  runAlignment: WrapAlignment.start,
                                  alignment: WrapAlignment.start,
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(8, 6),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.labelSmall(
                                        'small'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'medium'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(40, 24),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'large'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
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
                                'button_group'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                            ),
                            Divider(
                              height: 32,
                            ),
                            Padding(
                              padding: MySpacing.only(left: 16, bottom: 12),
                              child: ToggleButtons(
                                splashColor: contentTheme.primary.withAlpha(48),
                                color: contentTheme.onBackground,
                                selectedBorderColor:
                                    contentTheme.primary.withAlpha(48),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppStyle.containerRadius.small)),
                                isSelected: controller.selected,
                                onPressed: controller.onSelect,
                                children: <Widget>[
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    color: contentTheme.primary,
                                    size: 24,
                                  ),
                                  Icon(
                                    Icons.dark_mode_outlined,
                                    color: contentTheme.primary,
                                    size: 24,
                                  ),
                                  Icon(
                                    Icons.brightness_6_outlined,
                                    color: contentTheme.primary,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            MySpacing.height(16),
                            Padding(
                              padding: MySpacing.only(left: 16, bottom: 12),
                              child: ToggleButtons(
                                splashColor: contentTheme.primary.withAlpha(48),
                                color: contentTheme.onBackground,
                                selectedBorderColor:
                                    contentTheme.primary.withAlpha(48),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppStyle.containerRadius.small)),
                                isSelected: controller.selected,
                                onPressed: controller.onSelect,
                                children: <Widget>[
                                  Padding(
                                    padding: MySpacing.x(16),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.wb_sunny_outlined,
                                          color: contentTheme.primary,
                                          size: 24,
                                        ),
                                        MySpacing.width(12),
                                        MyText.labelLarge(
                                          'light'.tr(),
                                          color: contentTheme.primary,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: MySpacing.x(16),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.dark_mode_outlined,
                                          color: contentTheme.primary,
                                          size: 24,
                                        ),
                                        MySpacing.width(12),
                                        MyText.labelLarge(
                                          'dark'.tr(),
                                          color: contentTheme.primary,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: MySpacing.x(16),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.brightness_6_outlined,
                                          color: contentTheme.primary,
                                          size: 24,
                                        ),
                                        MySpacing.width(12),
                                        MyText.labelLarge(
                                          'system'.tr(),
                                          color: contentTheme.primary,
                                        )
                                      ],
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
            ],
          );
        },
      ),
    );
  }
}
