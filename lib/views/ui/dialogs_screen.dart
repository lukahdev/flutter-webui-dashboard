import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/ui/dialogs_controller.dart';
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

class DialogsScreen extends StatefulWidget {
  const DialogsScreen({super.key});

  @override
  State<DialogsScreen> createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late DialogsController controller;

  @override
  void initState() {
    controller = Get.put(DialogsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: GetBuilder<DialogsController>(
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
                          "dialogs".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        MyBreadcrumb(
                          children: [
                            MyBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                            MyBreadcrumbItem(
                                name: 'dialogs'.tr(), active: true),
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
                                      'type_/_size'.tr().capitalizeWords,
                                      fontWeight: 600,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Divider(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 8),
                                    child: Wrap(
                                      spacing: flexSpacing / 2,
                                      runSpacing: flexSpacing / 2,
                                      children: [
                                        MyButton(
                                          onPressed: _showAlertDialog,
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          backgroundColor: contentTheme.primary,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'alert'.tr(),
                                            color: contentTheme.onPrimary,
                                          ),
                                        ),
                                        MyButton(
                                          onPressed: _showStandardDialog,
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          backgroundColor: contentTheme.success,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'standard'.tr(),
                                            color: contentTheme.onSuccess,
                                          ),
                                        ),
                                        MyButton(
                                          onPressed: _showFullWidthDialog,
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          backgroundColor: contentTheme.warning,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'full_width'.tr().capitalizeWords,
                                            color: contentTheme.onWarning,
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
                                      'positions'.tr(),
                                      fontWeight: 600,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Divider(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 8),
                                    child: Wrap(
                                      spacing: flexSpacing / 2,
                                      runSpacing: flexSpacing / 2,
                                      children: [
                                        MyButton(
                                          onPressed: _showLeftDialog,
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          backgroundColor: contentTheme.primary,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'left'.tr(),
                                            color: contentTheme.onPrimary,
                                          ),
                                        ),
                                        MyButton(
                                          onPressed: _showTopDialog,
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          backgroundColor: contentTheme.success,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'top'.tr(),
                                            color: contentTheme.onSuccess,
                                          ),
                                        ),
                                        MyButton(
                                          onPressed: _showRightDialog,
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          backgroundColor: contentTheme.warning,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'right'.tr(),
                                            color: contentTheme.onWarning,
                                          ),
                                        ),
                                        MyButton(
                                          onPressed: _showBottomDialog,
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          backgroundColor: contentTheme.info,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'bottom'.tr(),
                                            color: contentTheme.onInfo,
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
                                      'other'.tr(),
                                      fontWeight: 600,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Divider(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                        MySpacing.only(left: 16, bottom: 8),
                                    child: Wrap(
                                      spacing: flexSpacing / 2,
                                      runSpacing: flexSpacing / 2,
                                      children: [
                                        MyButton(
                                          onPressed: _showStaticDialog,
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          backgroundColor: contentTheme.primary,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'static'.tr(),
                                            color: contentTheme.onPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
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

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: MyText.labelLarge("confirmation?".tr()),
            content: MyText.bodySmall(
                "are_you_sure,_you_want_to_delete_history?".tr()),
            actions: [
              MyButton.rounded(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 0,
                padding: MySpacing.xy(20, 16),
                backgroundColor: contentTheme.secondary,
                child: MyText.labelMedium(
                  "close".tr(),
                  color: contentTheme.onSecondary,
                ),
              ),
              MyButton.rounded(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 0,
                padding: MySpacing.xy(20, 16),
                backgroundColor: contentTheme.primary,
                child: MyText.labelMedium(
                  "save".tr(),
                  color: contentTheme.onPrimary,
                ),
              ),
            ],
          );
        });
  }

  void _showStandardDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child:
                        MyText.labelLarge('dialog_title'.tr().capitalizeWords),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(controller.dummyTexts[0]),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.secondary,
                          child: MyText.labelMedium(
                            "close".tr(),
                            color: contentTheme.onSecondary,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.primary,
                          child: MyText.labelMedium(
                            "save".tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showFullWidthDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: MySpacing.all(16),
                  child: MyText.labelLarge('dialog_title'.tr().capitalizeWords),
                ),
                Divider(height: 0, thickness: 1),
                Padding(
                  padding: MySpacing.all(16),
                  child: MyText.bodySmall(controller.dummyTexts[1]),
                ),
                Divider(height: 0, thickness: 1),
                Padding(
                  padding: MySpacing.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton.rounded(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 0,
                        padding: MySpacing.xy(20, 16),
                        backgroundColor: contentTheme.secondary,
                        child: MyText.labelMedium(
                          "close".tr(),
                          color: contentTheme.onSecondary,
                        ),
                      ),
                      MySpacing.width(16),
                      MyButton.rounded(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 0,
                        padding: MySpacing.xy(20, 16),
                        backgroundColor: contentTheme.primary,
                        child: MyText.labelMedium(
                          "save".tr(),
                          color: contentTheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showRightDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: MySpacing.fromLTRB(
                MediaQuery.of(context).size.width - 350, 0, 0, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child:
                        MyText.labelLarge('right_dialog'.tr().capitalizeWords),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[2],
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.secondary,
                          child: MyText.labelMedium(
                            "close".tr(),
                            color: contentTheme.onSecondary,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.primary,
                          child: MyText.labelMedium(
                            "save".tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showBottomDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: MySpacing.fromLTRB(
                0, MediaQuery.of(context).size.height - 350, 0, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child:
                        MyText.labelLarge('bottom_dialog'.tr().capitalizeWords),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[3],
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.secondary,
                          child: MyText.labelMedium(
                            "close".tr(),
                            color: contentTheme.onSecondary,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.primary,
                          child: MyText.labelMedium(
                            "save".tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showTopDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: MySpacing.fromLTRB(
                0, 0, 0, MediaQuery.of(context).size.height - 350),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('top_dialog'.tr().capitalizeWords),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[4],
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.secondary,
                          child: MyText.labelMedium(
                            "close".tr(),
                            color: contentTheme.onSecondary,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.primary,
                          child: MyText.labelMedium(
                            "save".tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showLeftDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: MySpacing.fromLTRB(
                0, 0, MediaQuery.of(context).size.width - 350, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('left_dialog'.tr()),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[5],
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.secondary,
                          child: MyText.labelMedium(
                            "close".tr(),
                            color: contentTheme.onSecondary,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.primary,
                          child: MyText.labelMedium(
                            "save".tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showStaticDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: Row(
                      children: [
                        Expanded(
                            child: MyText.labelLarge(
                                'static_dialog'.tr().capitalizeWords)),
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close_outlined,
                              size: 20,
                              color: contentTheme.onBackground.withOpacity(0.5),
                            ))
                      ],
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(controller.dummyTexts[0]),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.secondary,
                          child: MyText.labelMedium(
                            "close".tr(),
                            color: contentTheme.onSecondary,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.primary,
                          child: MyText.labelMedium(
                            "save".tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
