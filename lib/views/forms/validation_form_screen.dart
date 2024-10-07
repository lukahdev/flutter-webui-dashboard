import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/forms/basic_form_controller.dart';
import 'package:webui/controller/forms/validation_forms_controller.dart';
import 'package:webui/helper/extensions/extensions.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

import 'package:webui/helper/widgets/my_breadcrumb.dart';

class ValidationFormScreen extends StatefulWidget {
  const ValidationFormScreen({super.key});

  @override
  State<ValidationFormScreen> createState() => _ValidationFormScreenState();
}

class _ValidationFormScreenState extends State<ValidationFormScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ValidationFormsController controller;

  @override
  void initState() {
    controller = Get.put(ValidationFormsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<ValidationFormsController>(
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
                        "validation_forms".tr().capitalizeWords,
                        fontSize: 18,
                        fontWeight: 600,
                      ),
                      MyBreadcrumb(
                        children: [
                          MyBreadcrumbItem(name: 'forms'.tr()),
                          MyBreadcrumbItem(
                              name: 'validation'.tr(), active: true),
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
                            shadow: MyShadow(elevation: 0.5),
                            paddingAll: flexSpacing,
                            child: Form(
                              key: controller.basicValidator.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.labelMedium(
                                    "full_name".tr().capitalizeWords,
                                  ),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('full_name'),
                                    controller: controller.basicValidator
                                        .getController('full_name'),
                                    decoration: InputDecoration(
                                        hintText: "Denish Navadiya",
                                        hintStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        contentPadding: MySpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never),
                                  ),
                                  MySpacing.height(16),
                                  MyText.labelMedium(
                                    "email_address".tr().capitalizeWords,
                                  ),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('email'),
                                    controller: controller.basicValidator
                                        .getController('email'),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "demo@getappui.com",
                                        hintStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          size: 20,
                                        ),
                                        contentPadding: MySpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never),
                                  ),
                                  MySpacing.height(16),
                                  MyText.labelMedium(
                                    "password".tr(),
                                  ),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('password'),
                                    controller: controller.basicValidator
                                        .getController('password'),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "****",
                                        hintStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          size: 20,
                                        ),
                                        contentPadding: MySpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never),
                                  ),
                                  MySpacing.height(20),
                                  MyText.labelMedium(
                                    "gender".tr(),
                                  ),
                                  MySpacing.height(8),
                                  DropdownButtonFormField<Gender>(
                                      dropdownColor: contentTheme.background,
                                      menuMaxHeight: 200,
                                      items: Gender.values
                                          .map((gender) =>
                                              DropdownMenuItem<Gender>(
                                                  value: gender,
                                                  child: MyText.labelMedium(
                                                    gender.name.capitalizeWords,
                                                  )))
                                          .toList(),
                                      icon: Icon(
                                        Icons.expand_more,
                                        size: 20,
                                      ),
                                      decoration: InputDecoration(
                                          hintText: "Select gender",
                                          hintStyle: MyTextStyle.bodySmall(
                                              xMuted: true),
                                          border: outlineInputBorder,
                                          enabledBorder: outlineInputBorder,
                                          focusedBorder: focusedInputBorder,
                                          contentPadding: MySpacing.all(16),
                                          isCollapsed: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never),
                                      onChanged: controller.basicValidator
                                          .onChanged<Object?>('gender'),
                                      validator: controller.basicValidator
                                          .getValidation<Gender?>('gender')),
                                  MySpacing.height(20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MyButton(
                                        onPressed: controller.onResetBasicForm,
                                        elevation: 0,
                                        padding: MySpacing.xy(20, 16),
                                        backgroundColor: contentTheme.secondary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: MyText.bodySmall(
                                          'clear'.tr(),
                                          color: contentTheme.onSecondary,
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      MyButton(
                                        onPressed: controller.onSubmitBasicForm,
                                        elevation: 0,
                                        padding: MySpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: MyText.bodySmall(
                                          'submit'.tr(),
                                          color: contentTheme.onPrimary,
                                        ),
                                      ),
                                    ],
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
          }),
    );
  }
}
