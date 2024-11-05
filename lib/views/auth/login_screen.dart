import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/auth/login_controller.dart';
import 'package:webui/controller/ui/notification_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/auth_layout.dart';
import 'package:webui/views/layout/layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late LoginController controller;
  late NotificationController notificationController;

  @override
  void initState() {
    notificationController = Get.put(NotificationController(this));
    controller = Get.put(
        LoginController(notificationController: notificationController));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder<LoginController>(
        init: controller,
        builder: (controller) {
          return Form(
            key: controller.basicValidator.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: MySpacing.all(40),
                  child: Row(
                    children: [
                      Image.asset(
                        Images.logoIcon,
                        height: 28,
                        alignment: Alignment.center,
                      ),
                      MyText.bodyLarge(
                        'Vendor Portal',
                        color: CupertinoColors.activeBlue,
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
                        "Welcome",
                        fontWeight: 700,
                        fontSize: 24,
                      ),
                      MyText.bodySmall(
                        "Login to your account",
                        fontSize: 14,
                        muted: true,
                      ),
                      MySpacing.height(40),
                      MyText.bodyMedium(
                        "Email",
                        fontWeight: 600,
                      ),
                      MySpacing.height(8),
                      TextFormField(
                        validator:
                            controller.basicValidator.getValidation('email'),
                        controller:
                            controller.basicValidator.getController('email'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: outlineInputBorder,
                            prefixIcon: const Icon(
                              LucideIcons.mail,
                              size: 20,
                            ),
                            contentPadding: MySpacing.all(16),
                            isCollapsed: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                      MySpacing.height(20),
                      MyText.bodyMedium(
                        "password".tr(),
                        fontWeight: 600,
                      ),
                      MySpacing.height(8),
                      TextFormField(
                        validator:
                            controller.basicValidator.getValidation('password'),
                        controller:
                            controller.basicValidator.getController('password'),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !controller.showPassword,
                        decoration: InputDecoration(
                            border: outlineInputBorder,
                            prefixIcon: const Icon(
                              LucideIcons.lock,
                              size: 20,
                            ),
                            suffixIcon: InkWell(
                              onTap: controller.onChangeShowPassword,
                              child: Icon(
                                controller.showPassword
                                    ? LucideIcons.eye
                                    : LucideIcons.eye_off,
                                size: 20,
                              ),
                            ),
                            contentPadding: MySpacing.all(16),
                            isCollapsed: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                      MySpacing.height(12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: MyButton.text(
                          onPressed: () => controller.goToForgotPassword(),
                          elevation: 0,
                          padding: MySpacing.xy(8, 0),
                          splashColor: contentTheme.secondary.withOpacity(0.1),
                          child: MyText.labelSmall(
                            'forgot_password?'.tr().capitalizeWords,
                            color: contentTheme.secondary,
                          ),
                        ),
                      ),
                      MySpacing.height(20),
                      Center(
                        child: MyButton.block(
                          onPressed: () => controller.onLogin(),
                          elevation: 0,
                          padding: MySpacing.xy(40, 20),
                          backgroundColor: contentTheme.primary,
                          child: MyText.bodyMedium(
                            'login'.tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ),
                      ),
                      MySpacing.height(20),
                      MyButton.outlined(
                        borderColor: contentTheme.primary,
                        onPressed: controller.gotoRegister,
                        elevation: 0,
                        splashColor: contentTheme.secondary.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.vendorLogo),
                            MySpacing.width(12),
                            MyText.labelMedium(
                              'Create a Vendor Account',
                              color: contentTheme.secondary,
                            ),
                          ],
                        ),
                      ),
                      // MySpacing.height(16),
                      // Center(
                      //   child: MyButton.text(
                      //       onPressed: controller.gotoRegister,
                      //       padding: MySpacing.xy(8, 4),
                      //       child: MyText.bodyMedium(
                      //         "Don't have a Vendor account",
                      //         fontWeight: 600,
                      //       )),
                      // )
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
