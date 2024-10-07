import 'package:get/get.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/models/product_data.dart';

class ProductController extends MyController {
  List<Product> products = [];

  @override
  void onInit() {
    super.onInit();

    Product.dummyList.then((value) {
      products = value;
      update();
    });
  }

  void goToCreateProduct() {
    Get.toNamed('/apps/ecommerce/add_products');
  }
}
