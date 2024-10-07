import 'package:webui/controller/my_controller.dart';
import 'package:webui/models/discover_data.dart';

class TimeLineController extends MyController {
  List<Discover> discover = [];

  @override
  void onInit() {
    super.onInit();
    Discover.dummyList.then((value) {
      discover = value.sublist(0, 10);
      update();
    });
  }
}
