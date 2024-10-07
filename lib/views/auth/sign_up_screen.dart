import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/auth/sign_up_controller.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/auth_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late SignUpController controller;

  @override
  void initState() {
    controller = Get.put(SignUpController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder<SignUpController>(
        init: controller,
        builder: (controller) {
          return Form(
            key: controller.basicValidator.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: MySpacing.all(40),
                  child: Row(
                    children: [
                      Image.asset(
                        Images.logoIcon,
                        height: 32,
                        alignment: Alignment.center,
                      ),
                      MyText.bodyLarge(
                        'WEBUI',
                        fontSize: 30,
                        textAlign: TextAlign.center,
                        fontWeight: 600,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: MySpacing.xy(50, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.titleLarge(
                        'Sign Up',
                        fontSize: 40,
                        muted: true,
                      ),
                      MySpacing.height(30),
                      MyText.bodyMedium(
                        'Name',
                      ),
                      MySpacing.height(8),
                      TextFormField(
                        validator: controller.basicValidator
                            .getValidation('name'),
                        controller: controller.basicValidator
                            .getController('name'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: outlineInputBorder,
                            contentPadding: MySpacing.all(16),
                            isCollapsed: true,
                            floatingLabelBehavior:
                            FloatingLabelBehavior.never),
                      ),
                      MySpacing.height(20),
                      MyText.bodyMedium(
                        'Email Address',
                      ),
                      MySpacing.height(8),
                      TextFormField(
                        validator: controller.basicValidator
                            .getValidation('email'),
                        controller: controller.basicValidator
                            .getController('email'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: outlineInputBorder,
                            contentPadding: MySpacing.all(16),
                            isCollapsed: true,
                            floatingLabelBehavior:
                            FloatingLabelBehavior.never),
                      ),
                      MySpacing.height(20),
                      MyText.bodyMedium(
                        'Password',
                      ),
                      MySpacing.height(8),
                      TextFormField(
                        validator: controller.basicValidator
                            .getValidation('password'),
                        controller: controller.basicValidator
                            .getController('password'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: outlineInputBorder,
                            contentPadding: MySpacing.all(16),
                            isCollapsed: true,
                            floatingLabelBehavior:
                            FloatingLabelBehavior.never),
                      ),
                      MySpacing.height(12),
                      InkWell(
                        onTap: () => controller
                            .onChangeCheckBox(!controller.isChecked),
                        child: Row(
                          children: [
                            Checkbox(
                              onChanged: controller.onChangeCheckBox,
                              value: controller.isChecked,
                              activeColor: theme.colorScheme.primary,
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              visualDensity: getCompactDensity,
                            ),
                            MySpacing.width(8),
                            Expanded(
                              child: MyText.bodyMedium(
                                "I agree to all the statements in the term and service",
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MySpacing.height(40),
                      Center(
                        child: MyButton.block(
                            elevation: 0,
                            backgroundColor: contentTheme.primary,
                            padding: MySpacing.xy(40, 20),
                            onPressed: () {},
                            child: MyText.bodyMedium(
                              'Create account',
                              color: contentTheme.onPrimary,
                            )),
                      ),
                      MySpacing.height(24),
                      Center(
                        child: InkWell(
                          onTap: () => controller.gotoLogin(),
                          child: RichText(
                            text: TextSpan(
                                text: 'Already a member? ',
                                style: MyTextStyle.bodyMedium(),
                                children: [
                                  TextSpan(
                                    text: 'Sign in',
                                    style: MyTextStyle.bodyMedium(
                                        color: contentTheme.primary),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
