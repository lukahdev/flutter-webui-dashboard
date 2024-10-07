import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/extra_screens/pricing_controller.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late PricingController controller;

  @override
  void initState() {
    controller = Get.put(PricingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Pricing",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Extra Pages'),
                        MyBreadcrumbItem(name: 'Pricing', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(22),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Our ',
                      style: MyTextStyle.getStyle(
                        fontSize: 32,
                      ),
                      children: [
                        TextSpan(
                          text: 'Plans',
                          style: MyTextStyle.getStyle(
                              fontSize: 32, fontWeight: 600),
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(12),
                  SizedBox(
                    width: 400,
                    child: Center(
                      child: MyText.bodySmall(
                        controller.dummyTexts[7],
                        maxLines: 2,
                        muted: true,
                      ),
                    ),
                  ),
                ],
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  wrapAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  children: [
                    MyFlexItem(
                      sizes: "lg-4 md-12",
                      child: MyCard(
                        onTap: () {
                          controller.select(1);
                        },
                        shadow: MyShadow(
                            elevation: 1, position: MyShadowPosition.bottom),
                        color: controller.selectPrice == 1
                            ? contentTheme.primary
                            : contentTheme.onPrimary,
                        paddingAll: 24,
                        child: Column(
                          children: [
                            MyText.titleMedium(
                              "PROFESSIONAL PACK",
                              fontWeight: 600,
                              color: controller.selectPrice == 1
                                  ? contentTheme.onPrimary
                                  : contentTheme.dark,
                            ),
                            MySpacing.height(32),
                            MyContainer.rounded(
                              height: 60,
                              width: 60,
                              color: controller.selectPrice == 1
                                  ? contentTheme.onPrimary.withOpacity(0.12)
                                  : contentTheme.primary.withOpacity(0.12),
                              child: Center(
                                child: Icon(
                                  LucideIcons.users,
                                  color: controller.selectPrice == 1
                                      ? contentTheme.onPrimary
                                      : contentTheme.primary,
                                ),
                              ),
                            ),
                            MySpacing.height(32),
                            RichText(
                              text: TextSpan(
                                text: '\$ 19',
                                style: MyTextStyle.getStyle(
                                  fontSize: 32,
                                  fontWeight: 600,
                                  color: controller.selectPrice == 1
                                      ? contentTheme.onPrimary
                                      : contentTheme.dark,
                                ),
                                children: [
                                  TextSpan(
                                    text: '/ Month',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                      color: controller.selectPrice == 1
                                          ? contentTheme.onPrimary
                                          : contentTheme.dark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MySpacing.height(32),
                            buildText(
                              "10 GB Storage",
                              controller.selectPrice == 1
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "500 GB BandWidth",
                              controller.selectPrice == 1
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "No Domain",
                              controller.selectPrice == 1
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "1 User",
                              controller.selectPrice == 1
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "Email Support",
                              controller.selectPrice == 1
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "24 x 7 Support",
                              controller.selectPrice == 1
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(32),
                            MyButton(
                              onPressed: () {},
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              backgroundColor: controller.selectPrice == 1
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                              borderRadiusAll: AppStyle.buttonRadius.medium,
                              child: MyText.bodySmall(
                                'Sign Up',
                                color: controller.selectPrice == 1
                                    ? contentTheme.primary
                                    : contentTheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-4 md-12",
                      child: MyCard(
                        shadow: MyShadow(
                            elevation: 1, position: MyShadowPosition.bottom),
                        onTap: () {
                          controller.select(2);
                        },
                        color: controller.selectPrice == 2
                            ? contentTheme.primary
                            : contentTheme.onPrimary,
                        paddingAll: 24,
                        child: Column(
                          children: [
                            MyText.titleMedium(
                              "BUSINESS PACK",
                              fontWeight: 600,
                              color: controller.selectPrice == 2
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(32),
                            MyContainer.rounded(
                              height: 60,
                              width: 60,
                              color: controller.selectPrice == 2
                                  ? contentTheme.onPrimary.withOpacity(0.12)
                                  : contentTheme.primary.withOpacity(0.12),
                              child: Center(
                                child: Icon(
                                  Icons.workspace_premium,
                                  color: controller.selectPrice == 2
                                      ? contentTheme.onPrimary
                                      : contentTheme.primary,
                                ),
                              ),
                            ),
                            MySpacing.height(32),
                            RichText(
                              text: TextSpan(
                                text: '\$ 29',
                                style: MyTextStyle.getStyle(
                                  fontSize: 32,
                                  fontWeight: 600,
                                  color: controller.selectPrice == 2
                                      ? contentTheme.onPrimary
                                      : contentTheme.dark,
                                ),
                                children: [
                                  TextSpan(
                                    text: '/ Month',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                      color: controller.selectPrice == 2
                                          ? contentTheme.onPrimary
                                          : contentTheme.dark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MySpacing.height(32),
                            buildText(
                              "50 GB Storage",
                              controller.selectPrice == 2
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "900 GB BandWidth",
                              controller.selectPrice == 2
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "2 Domain",
                              controller.selectPrice == 2
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "10 User",
                              controller.selectPrice == 2
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "Email Support",
                              controller.selectPrice == 2
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "24 x 7 Support",
                              controller.selectPrice == 2
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(32),
                            MyButton(
                              onPressed: () {},
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              backgroundColor: controller.selectPrice == 2
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                              borderRadiusAll: AppStyle.buttonRadius.medium,
                              child: MyText.bodySmall(
                                'Sign Up',
                                color: controller.selectPrice == 2
                                    ? contentTheme.primary
                                    : contentTheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-4 md-12",
                      child: MyCard(
                        onTap: () {
                          controller.select(3);
                        },
                        color: controller.selectPrice == 3
                            ? contentTheme.primary
                            : contentTheme.onPrimary,
                        shadow: MyShadow(
                            elevation: 1, position: MyShadowPosition.bottom),
                        paddingAll: 24,
                        child: Column(
                          children: [
                            MyText.titleMedium(
                              "ENTERPRISE PACK",
                              fontWeight: 600,
                              color: controller.selectPrice == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(32),
                            MyContainer.rounded(
                              height: 60,
                              width: 60,
                              color: controller.selectPrice == 3
                                  ? contentTheme.onPrimary.withOpacity(0.12)
                                  : contentTheme.primary.withOpacity(0.12),
                              child: Center(
                                child: Icon(
                                  Icons.work_outline,
                                  color: controller.selectPrice == 3
                                      ? contentTheme.onPrimary
                                      : contentTheme.primary,
                                ),
                              ),
                            ),
                            MySpacing.height(44),
                            MyText.titleMedium(
                              'Based on Usage',
                              fontWeight: 600,
                              color: controller.selectPrice == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.dark,
                            ),
                            MySpacing.height(44),
                            buildText(
                              "100 GB Storage",
                              controller.selectPrice == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "Unlimited BandWidth",
                              controller.selectPrice == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "Unlimited Domain",
                              controller.selectPrice == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "Unlimited User",
                              controller.selectPrice == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "Email Support",
                              controller.selectPrice == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(16),
                            buildText(
                              "24 x 7 Support",
                              controller.selectPrice == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                            ),
                            MySpacing.height(32),
                            MyButton(
                              onPressed: () {},
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              backgroundColor: controller.selectPrice == 3
                                  ? contentTheme.onPrimary
                                  : contentTheme.primary,
                              borderRadiusAll: AppStyle.buttonRadius.medium,
                              child: MyText.bodySmall(
                                'Contact US',
                                color: controller.selectPrice == 3
                                    ? contentTheme.primary
                                    : contentTheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildText(String text, Color? color) {
    return MyText.bodySmall(
      text,
      fontSize: 14,
      color: color,
    );
  }
}
