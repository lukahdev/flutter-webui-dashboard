import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/controller/ui/notification_controller.dart';
import 'package:webui/helper/services/auth_services.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/helper/widgets/my_text_utils.dart';
import 'package:webui/helper/widgets/my_validators.dart';
import 'package:webui/models/error_data.dart';

class LoginController extends MyController {
  late NotificationController? notificationController;

  MyFormValidator basicValidator = MyFormValidator();
  int selectTime = 1;
  bool showPassword = false, isChecked = false;

  LoginController({this.notificationController});

  @override
  void onInit() {
    super.onInit();
    basicValidator.addField('email',
        required: true,
        label: "Email",
        validators: [MyEmailValidator()],
        controller: TextEditingController());

    basicValidator.addField('password',
        required: true,
        label: "Password",
        validators: [MyLengthValidator(min: 6, max: 10)],
        controller: TextEditingController());
  }

  void select(int select) {
    selectTime = select;
    update();
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onChangeCheckBox(bool? value) {
    isChecked = value ?? isChecked;
    update();
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      update();
      var errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        print("[LoginScreen] ERR: ${(jsonEncode(errors))}");
        if (errors.containsKey('notify')) {
          onError(error: ErrorData.fromJson(errors));
        } else {
          basicValidator.addErrors(errors);
          basicValidator.validateForm();
          basicValidator.clearErrors();
        }
      } else {
        print("[LoginScreen] SUCCESS");
        Get.toNamed(getNextUrl());
      }

      update();
    }
  }

  String getNextUrl() {
    return Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? "")
            .queryParameters['next'] ??
        "/dashboard";
  }

  void goToForgotPassword() {
    Get.toNamed('/auth/forgot_password');
  }

  void gotoRegister() {
    Get.offAndToNamed('/auth/sign_up');
  }

  void onError({bool isBanner = true, required ErrorData error}) {
    notificationController?.showBanner = isBanner;
    notificationController?.onChangeColor(ContentThemeColor.red);
    notificationController?.toastTitleController.text = error.message;
    notificationController?.show();
  }
}
