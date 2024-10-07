import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/apps/ecommerce/product_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/utils/utils.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_list_extension.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/layout.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ProductController controller;

  @override
  void initState() {
    controller = Get.put(ProductController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: GetBuilder<ProductController>(
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
                          "products".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        MyBreadcrumb(
                          children: [
                            MyBreadcrumbItem(name: 'ecommerce'.tr()),
                            MyBreadcrumbItem(
                                name: 'products'.tr(), active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(flexSpacing),
                  MyCard(
                      shadow: MyShadow(
                          elevation: 0.5, position: MyShadowPosition.bottom),
                      margin: MySpacing.x(flexSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyButton(
                            onPressed: controller.goToCreateProduct,
                            elevation: 0,
                            padding: MySpacing.xy(20, 16),
                            backgroundColor: contentTheme.primary,
                            borderRadiusAll: AppStyle.buttonRadius.medium,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_outlined,
                                  size: 20,
                                  color: contentTheme.onPrimary,
                                ),
                                MySpacing.width(8),
                                MyText.labelMedium(
                                  'create_product'.tr().capitalizeWords,
                                  color: contentTheme.onPrimary,
                                ),
                              ],
                            ),
                          ),
                          MySpacing.height(16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: MyContainer.none(
                              borderRadiusAll: 4,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: DataTable(
                                  sortAscending: true,
                                  onSelectAll: (_) => {},
                                  headingRowColor: WidgetStatePropertyAll(
                                      contentTheme.primary.withAlpha(40)),
                                  dataRowMaxHeight: 60,
                                  showBottomBorder: false,
                                  columns: [
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'id'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'name'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'price'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'rating'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'sku'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'stock'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'orders'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'created_at'.tr().capitalizeWords,
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'action'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                  ],
                                  rows: controller.products
                                      .mapIndexed((index, data) =>
                                          DataRow(cells: [
                                            DataCell(MyText.bodyMedium(
                                                '#${data.id}')),
                                            DataCell(SizedBox(
                                              width: 300,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  MyContainer.none(
                                                      borderRadiusAll: 20,
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      child: Image.asset(
                                                        Images.squareImages[
                                                            index %
                                                                Images
                                                                    .squareImages
                                                                    .length],
                                                        height: 40,
                                                        width: 40,
                                                        fit: BoxFit.cover,
                                                      )),
                                                  MySpacing.width(16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      MyText.labelLarge(
                                                          data.name.toString()),
                                                      MyText.labelSmall(
                                                        data.category
                                                            .toString(),
                                                        muted: true,
                                                        letterSpacing: 0,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )),
                                            DataCell(MyText.bodyMedium(
                                                '\$${data.price}')),
                                            DataCell(Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.star_outline_rounded,
                                                  color:
                                                      AppColors.ratingStarColor,
                                                  size: 20,
                                                ),
                                                MySpacing.width(4),
                                                MyText.bodySmall(
                                                    '${data.rating} (${data.ratingCount})')
                                              ],
                                            )),
                                            DataCell(
                                                MyText.bodyMedium(data.sku)),
                                            DataCell(MyText.bodyMedium(
                                                '${data.stock}')),
                                            DataCell(MyText.bodyMedium(
                                                '${data.ordersCount}')),
                                            DataCell(Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                MyText.labelLarge(
                                                    '${Utils.getDateStringFromDateTime(data.createdAt, showMonthShort: true)}'),
                                                MySpacing.width(4),
                                                MyText.bodySmall(
                                                  '${Utils.getTimeStringFromDateTime(data.createdAt, showSecond: false)}',
                                                  muted: true,
                                                  fontWeight: 600,
                                                )
                                              ],
                                            )),
                                            DataCell(Align(
                                              alignment: Alignment.center,
                                              child: MyContainer.bordered(
                                                onTap: () => {},
                                                padding: MySpacing.xy(6, 6),
                                                borderColor: contentTheme
                                                    .primary
                                                    .withAlpha(40),
                                                child: Icon(
                                                  LucideIcons.pencil,
                                                  size: 12,
                                                  color: contentTheme.primary,
                                                ),
                                              ),
                                            )),
                                            // DataCell(MyText.bodyMedium('${DateTime.tryParse('2022-11-26T15:56:14Z')}')),
                                          ]))
                                      .toList()),
                            ),
                          ),
                        ],
                      )),
                ],
              );
            }));
  }
}
