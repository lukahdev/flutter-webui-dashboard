import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/apps/contact/edit_profile_controller.dart';
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
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
    with SingleTickerProviderStateMixin, UIMixin {
  late EditProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(EditProfileController());
  }

  final ImagePicker picker = ImagePicker();

  XFile? imageFile;

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
                      "Edit Profile",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Contact"),
                        MyBreadcrumbItem(name: "Edit Profile", active: true),
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
                      sizes: 'lg-6',
                      child: MyCard(
                        paddingAll: 0,
                        shadow: MyShadow(elevation: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: contentTheme.primary.withOpacity(0.08),
                              padding: MySpacing.xy(16, 12),
                              child: Row(
                                children: [
                                  Icon(
                                    LucideIcons.pencil,
                                    color: contentTheme.primary,
                                    size: 16,
                                  ),
                                  MySpacing.width(12),
                                  MyText.titleMedium(
                                    "edit_profile".tr(),
                                    fontWeight: 600,
                                    color: contentTheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            MySpacing.height(16),
                            Padding(
                              padding: MySpacing.x(20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: buildTextField(
                                            "First Name", "First Name"),
                                      ),
                                      MySpacing.width(12),
                                      Expanded(
                                        child: buildTextField(
                                            "Last Name", "Last Name"),
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(12),
                                  buildTextField("User Name", "User Name"),
                                  MySpacing.height(12),
                                  buildTextField(
                                      "Profession", "Your Profession"),
                                  MySpacing.height(12),
                                  buildTextField("Location", "Your Location"),
                                  MySpacing.height(12),
                                  buildTextField("Phone", "Enter Phone Number"),
                                  MySpacing.height(16),
                                  MyButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: MySpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: MyText.bodySmall(
                                      'Save',
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                  MySpacing.height(16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6",
                      child: MyCard(
                        paddingAll: 0,
                        shadow: MyShadow(elevation: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: contentTheme.primary.withOpacity(0.08),
                              padding: MySpacing.xy(16, 12),
                              child: Row(
                                children: [
                                  Icon(
                                    LucideIcons.pencil,
                                    color: contentTheme.primary,
                                    size: 16,
                                  ),
                                  MySpacing.width(12),
                                  MyText.titleMedium(
                                    "change_password".tr(),
                                    fontWeight: 600,
                                    color: contentTheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: MySpacing.x(20),
                              child: Column(
                                children: [
                                  MySpacing.height(12),
                                  buildTextField(
                                      "Current Password", "Current Password"),
                                  MySpacing.height(12),
                                  buildTextField(
                                      "New Password", "New Password"),
                                  MySpacing.height(12),
                                  buildTextField(
                                      "Confirm Password", "Confirm Password"),
                                  MySpacing.height(16),
                                  MyButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: MySpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: MyText.bodySmall(
                                      'Conform Password',
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                  MySpacing.height(16),
                                ],
                              ),
                            )
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

  Widget buildTextField(String fieldTitle, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(
          fieldTitle,
        ),
        MySpacing.height(8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.bodySmall(xMuted: true),
            border: outlineInputBorder,
            contentPadding: MySpacing.all(16),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');

    return newValue.copyWith(
      text: text.isNotEmpty ? text : '',
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
