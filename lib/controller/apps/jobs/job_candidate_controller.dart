import 'package:webui/controller/my_controller.dart';
import 'package:webui/models/discover_data.dart';

class JobCandidateController extends MyController {
  List<Discover> jobCandidate = [];

  String selectJob = "Select Job";
  String selectRating = "Select Rating";

  @override
  void onInit() {
    super.onInit();
    Discover.dummyList.then((value) {
      jobCandidate = value.sublist(0, 16);
      update();
    });
  }

  void onSelectedJob(String job) {
    selectJob = job;
    update();
  }

  void onSelectedRating(String rating) {
    selectRating = rating;
    update();
  }
}
