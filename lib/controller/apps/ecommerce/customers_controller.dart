import 'package:get/get.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/models/customer.dart';

class CustomersController extends MyController {
  List<Customer> customers = [];

  CustomersController();

  @override
  void onInit() {
    super.onInit();
    Customer.dummyList.then((value) {
      customers = value;
      update();
    });
  }

  void goToDashboard() {
    Get.toNamed('/dashboard');
  }
}
