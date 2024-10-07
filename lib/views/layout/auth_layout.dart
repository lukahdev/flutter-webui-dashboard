import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/layout/auth_layout_controller.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_responsiv.dart';
import 'package:webui/helper/widgets/my_screen_media_type.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/images.dart';

class AuthLayout extends StatelessWidget {
  final Widget? child;
  ContentTheme get contentTheme => AdminTheme.theme.contentTheme;

  final AuthLayoutController controller = AuthLayoutController();

  AuthLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context, _, screenMT) {
      return GetBuilder(
          init: controller,
          builder: (controller) {
            return screenMT.isMobile
                ? mobileScreen(context)
                : largeScreen(context);
          });
    });
  }

  Widget mobileScreen(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Container(
        padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
        height: MediaQuery.of(context).size.height,
        color: theme.cardTheme.color,
        child: SingleChildScrollView(
          key: controller.scrollKey,
          child: child,
        ),
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(child: Container(
              padding: MySpacing.x(300),
              child: child,)),
            buildImage()
          ],
        ),

    );
  }


  Widget buildImage() {
    return MyResponsive(
      builder: (_, __, type) {
        if([MyScreenMediaType.xxl, MyScreenMediaType.xl, MyScreenMediaType.lg].contains(type)){
          return buildCard();
        }
        return SizedBox();
      },
    );
  }

  Widget buildCard() {
    return Container(
      // borderRadiusAll: 0,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/auth/background.jpg'), fit: BoxFit.fill, opacity: 0.75, ),
        border: Border(
            // color: Colors.black, width: 16
          left: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      padding: MySpacing.x(72),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Center(
        child: MyCard(
          height: 240,
          color: Colors.white.withAlpha(240),
          width: 600,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyContainer(
                height: 200,
                width: 200,
                color: contentTheme.primary.withAlpha(30),
                paddingAll: 0,
                child: Image.asset(
                  Images.shoes[0],
                ),
              ),
              MySpacing.width(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MyText.titleMedium(
                            'Nike Adapt BB 2.0',

                            fontWeight: 600,
                            height: -1,
                          ),
                        ),
                        Icon(LucideIcons.star, size: 16, color: AppColors.orange.onColor,)
                      ],
                    ),
                   MyText.bodySmall('Consistent, customized fit, game-changing.',),
                    MySpacing.height(16),
                    Row(
                      children: [
                        MyText.bodyMedium(
                          '\$279.97',
                          fontWeight: 600,
                        ),
                        MySpacing.width(12),
                        MyText.bodySmall(
                          '20% Off',
                          color: contentTheme.primary,
                        ),
                      ],
                    ),
                    MySpacing.height(16),
                    Row(
                      children: [
                        MyContainer.rounded(
                          height: 32,
                          width: 32,
                          paddingAll: 0,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onTap: () {
                            controller.select(1);
                          },
                          color: controller.selectTime == 1
                              ? contentTheme.primary
                              : contentTheme.onPrimary,
                          child: Center(
                              child: MyText.bodyMedium(
                                'XS',
                                color: controller.selectTime == 1
                                    ? contentTheme.onPrimary
                                    : contentTheme.primary,
                              )),
                        ),
                        MySpacing.width(8),
                        MyContainer.rounded(
                          onTap: () {
                            controller.select(2);
                          },
                          height: 32,
                          width: 32,
                          paddingAll: 0,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: controller.selectTime == 2
                              ? contentTheme.primary
                              : contentTheme.onPrimary,
                          child: Center(
                            child: MyText.bodyMedium(
                              'S',
                              color: controller.selectTime == 2
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                          ),
                        ),
                        MySpacing.width(8),
                        MyContainer.rounded(
                          onTap: () {
                            controller.select(3);
                          },
                          height: 32,
                          width: 32,
                          paddingAll: 0,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: controller.selectTime == 3
                              ? contentTheme.primary
                              : contentTheme.onPrimary,
                          child: Center(
                            child: MyText.bodyMedium(
                              'M',
                              color: controller.selectTime == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                          ),
                        ),
                        MySpacing.width(8),
                        MyContainer.rounded(
                          onTap: () {
                            controller.select(4);
                          },
                          height: 32,
                          width: 32,
                          paddingAll: 0,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: controller.selectTime == 4
                              ? contentTheme.primary
                              : contentTheme.onPrimary,
                          child: Center(
                            child: MyText.bodyMedium(
                              'L',
                              color: controller.selectTime == 4
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                          ),
                        ),
                        MySpacing.width(8),
                        MyContainer.rounded(
                          onTap: () {
                            controller.select(5);
                          },
                          height: 32,
                          width: 32,
                          paddingAll: 0,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: controller.selectTime == 5
                              ? contentTheme.primary
                              : contentTheme.onPrimary,
                          child: Center(
                            child: MyText.bodyMedium(
                              'XL',
                              color: controller.selectTime == 5
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyContainer(
                          paddingAll: 0,
                          color: contentTheme.primary,
                          onTap: () {},
                          child: Padding(
                            padding: MySpacing.xy(8, 8),
                            child: MyText.bodyMedium(
                              'Buy Now',
                              color: contentTheme.onPrimary,
                            ),
                          ),
                        ),
                        MySpacing.width(16),
                        MyContainer(
                          paddingAll: 0,
                          color: contentTheme.secondary,
                          onTap: () {},
                          child: Padding(
                            padding: MySpacing.xy(8, 8),
                            child: MyText.bodyMedium(
                              'Add To Bag',
                              color: contentTheme.onPrimary,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
