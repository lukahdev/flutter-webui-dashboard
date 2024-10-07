import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/widgets/my_text_utils.dart';

class PricingController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  int selectPrice = 1;

  void select(int select) {
    selectPrice = select;
    update();
  }
}
