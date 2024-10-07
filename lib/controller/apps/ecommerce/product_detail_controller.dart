import 'package:flutter/material.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/utils/my_utils.dart';
import 'package:webui/images.dart';
import 'package:webui/models/product_detail_data.dart';

enum Size {
  small,
  medium,
  large,
  xl;

  const Size();
}

class ProductDetailController extends MyController {
  List<ProductDetailData> productDetail = [];
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  final TickerProvider tickerProvider;
  String selectedImage = Images.squareImages[2];

  List<String> images = [
    Images.squareImages[2],
    Images.squareImages[3],
    Images.squareImages[5],
    Images.squareImages[4],
  ];

  int defaultIndex = 0;
  int selectedQuntity = 1;
  String selectSize = "Small";
  late TabController defaultTabController = TabController(
    length: 2,
    vsync: tickerProvider,
    initialIndex: defaultIndex,
  );

  ProductDetailController(this.tickerProvider);

  @override
  void onInit() {
    super.onInit();
    ProductDetailData.dummyList.then((value) {
      productDetail = value;
      update();
    });

    defaultTabController.addListener(() {
      if (defaultIndex != defaultTabController.index) {
        defaultIndex = defaultTabController.index;
        update();
      }
    });
  }

  void onChangeImage(String image) {
    selectedImage = image;
    update();
  }

  void onSelectedQty(int qty) {
    selectedQuntity = qty;
    update();
  }

  void onSelectedSize(String size) {
    selectSize = size;
    update();
  }
}
