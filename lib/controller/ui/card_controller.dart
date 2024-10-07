import 'package:flutter/material.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/widgets/my_text_utils.dart';

class CardController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  MyShadowPosition shadowPosition = MyShadowPosition.center;
  double shadowElevation = 10;
  Color shadowColor = Colors.black;

  final GlobalKey shadowPositionKey = GlobalKey();

  void onChangePosition(MyShadowPosition position) {
    shadowPosition = position;
    update();
  }

  void onChangeElevation(double elevation) {
    shadowElevation = elevation;
    update();
  }

  void onChangeColor(Color color) {
    shadowColor = color;
    update();
  }
}
