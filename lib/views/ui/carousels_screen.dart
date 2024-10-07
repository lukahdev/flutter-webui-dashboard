import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/ui/carousels_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/layout.dart';

class CarouselsScreen extends StatefulWidget {
  const CarouselsScreen({super.key});

  @override
  State<CarouselsScreen> createState() => _CarouselsScreenState();
}

class _CarouselsScreenState extends State<CarouselsScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late CarouselsController controller;

  @override
  void initState() {
    controller = Get.put(CarouselsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: GetBuilder<CarouselsController>(
            init: controller,
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.x(flexSpacing),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.titleMedium(
                          "carousels".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        MyBreadcrumb(
                          children: [
                            MyBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                            MyBreadcrumbItem(
                                name: 'carousels'.tr(), active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(flexSpacing),
                  Padding(
                    padding: MySpacing.x(flexSpacing / 2),
                    child: MyFlex(
                      wrapAlignment: WrapAlignment.start,
                      wrapCrossAlignment: WrapCrossAlignment.start,
                      children: [
                        MyFlexItem(
                            sizes: "lg-6 md-12",
                            child: MyCard(
                              paddingAll: 0,
                              shadow: MyShadow(elevation: 0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: MySpacing.only(left: 16, top: 12),
                                    child: MyText.titleMedium(
                                      'simple'.tr(),
                                      fontWeight: 600,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Divider(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: MySpacing.only(
                                        left: 16,
                                        right: 16,
                                        bottom: 16,
                                        top: 8),
                                    child: simpleCarousel(),
                                  )
                                ],
                              ),
                            )),
                        MyFlexItem(
                            sizes: "lg-6 md-12",
                            child: MyCard(
                              paddingAll: 0,
                              shadow: MyShadow(elevation: 0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: MySpacing.only(left: 16, top: 12),
                                    child: MyText.titleMedium(
                                      'animated'.tr(),
                                      fontWeight: 600,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Divider(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: MySpacing.only(
                                        left: 16,
                                        right: 16,
                                        bottom: 16,
                                        top: 8),
                                    child: animatedCarousel(),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withAlpha(140),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  Widget simpleCarousel() {
    List<Widget> buildPageIndicatorStatic() {
      List<Widget> list = [];
      for (int i = 0; i < controller.simpleCarouselSize; i++) {
        list.add(i == controller.selectedSimpleCarousel
            ? indicator(true)
            : indicator(false));
      }
      return list;
    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedBox(
          height: 300,
          child: PageView(
            pageSnapping: true,
            scrollBehavior: AppScrollBehavior(),
            physics: ClampingScrollPhysics(),
            controller: controller.simplePageController,
            onPageChanged: controller.onChangeSimpleCarousel,
            children: <Widget>[
              MyContainer(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                paddingAll: 0,
                child: Image.asset(
                  Images.landscapeImages[0],
                  fit: BoxFit.fill,
                ),
              ),
              MyContainer(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                paddingAll: 0,
                child: Image.asset(
                  Images.landscapeImages[1],
                  fit: BoxFit.fill,
                ),
              ),
              MyContainer(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                paddingAll: 0,
                child: Image.asset(
                  Images.landscapeImages[2],
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildPageIndicatorStatic(),
          ),
        ),
      ],
    );
  }

  Widget animatedCarousel() {
    List<Widget> buildPageIndicatorStatic() {
      List<Widget> list = [];
      for (int i = 0; i < controller.animatedCarouselSize; i++) {
        list.add(i == controller.selectedAnimatedCarousel
            ? indicator(true)
            : indicator(false));
      }
      return list;
    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedBox(
          height: 300,
          child: PageView(
            pageSnapping: true,
            scrollBehavior: AppScrollBehavior(),
            physics: ClampingScrollPhysics(),
            controller: controller.animatedPageController,
            onPageChanged: controller.onChangeAnimatedCarousel,
            children: <Widget>[
              MyContainer(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                paddingAll: 0,
                child: Image.asset(
                  Images.landscapeImages[0],
                  fit: BoxFit.fill,
                ),
              ),
              MyContainer(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                paddingAll: 0,
                child: Image.asset(
                  Images.landscapeImages[1],
                  fit: BoxFit.fill,
                ),
              ),
              MyContainer(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                paddingAll: 0,
                child: Image.asset(
                  Images.landscapeImages[2],
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildPageIndicatorStatic(),
          ),
        ),
      ],
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
