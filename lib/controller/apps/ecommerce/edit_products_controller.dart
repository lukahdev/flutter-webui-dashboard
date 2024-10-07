import 'package:flutter/cupertino.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';

enum Status {
  online,
  offline,
  draft;

  const Status();
}

enum Category {
  fashion,
  grocery,
  vegetables,
  fruits,
  electronics,
  kids;

  const Category();
}

class AddProductsController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
  Status selectedGender = Status.online;

  @override
  void onInit() {
    super.onInit();
    basicValidator.addField(
      'name',
      label: "Product Name",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'shop_name',
      label: "shop_name",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'description',
      label: "description",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'tags',
      label: "Tags",
      required: true,
      controller: TextEditingController(),
    );
  }

  bool showOnline = true;

  void setOnlineType(bool value) {
    showOnline = value;
    update();
  }

  final List<String> categories = [];

  void onChangeGender(Status? value) {
    selectedGender = value ?? selectedGender;
    update();
  }
}
