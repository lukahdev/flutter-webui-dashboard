import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/apps/ecommerce/add_product_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/utils/utils.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_dotted_line.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_list_extension.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late AddProductsController controller;

  String? categories;

  @override
  void initState() {
    controller = Get.put(AddProductsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "add_product".tr().capitalizeWords,
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ecommerce'.tr()),
                        MyBreadcrumbItem(
                          name: 'add_product'.tr().capitalizeWords,
                          active: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyCard(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shadow: MyShadow(
                            elevation: 0.5, position: MyShadowPosition.bottom),
                        paddingAll: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: contentTheme.primary.withOpacity(0.08),
                              padding: MySpacing.xy(16, 12),
                              child: Row(
                                children: [
                                  Icon(
                                    LucideIcons.server,
                                    color: contentTheme.primary,
                                    size: 16,
                                  ),
                                  MySpacing.width(12),
                                  MyText.titleMedium(
                                    "general".tr(),
                                    fontWeight: 600,
                                    color: contentTheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: MySpacing.xy(flexSpacing, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.labelMedium(
                                    "product_name".tr().capitalizeWords,
                                  ),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('product_name'),
                                    controller: controller.basicValidator
                                        .getController('product_name'),
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: "eg: Tomatoes",
                                      hintStyle:
                                          MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                  MySpacing.height(25),
                                  MyText.labelMedium(
                                    "shop_name".tr().capitalizeWords,
                                  ),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('shop_name'),
                                    controller: controller.basicValidator
                                        .getController('shop_name'),
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: "eg: Fruits",
                                      hintStyle:
                                          MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                  MySpacing.height(25),
                                  MyText.labelMedium(
                                    "description".tr(),
                                  ),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('description'),
                                    controller: controller.basicValidator
                                        .getController('description'),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText:
                                          "It's contains blah blah things",
                                      hintStyle:
                                          MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                  MySpacing.height(25),
                                  MyFlex(contentPadding: false, children: [
                                    MyFlexItem(
                                        sizes: 'lg-6 md-12',
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "category".tr(),
                                            ),
                                            MySpacing.height(8),
                                            DropdownButtonFormField<Category>(
                                              dropdownColor:
                                                  contentTheme.background,
                                              menuMaxHeight: 200,
                                              isDense: true,

                                              // itemHeight: 40,
                                              items: Category.values
                                                  .map(
                                                    (category) =>
                                                        DropdownMenuItem<
                                                            Category>(
                                                      value: category,
                                                      child: MyText.labelMedium(
                                                        category.name
                                                            .capitalizeWords,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                              icon: Icon(
                                                Icons.expand_more,
                                                size: 20,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: "Select category",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(14),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                              onChanged: controller
                                                  .basicValidator
                                                  .onChanged<Object?>(
                                                'category',
                                              ),
                                            )
                                          ],
                                        )),
                                    MyFlexItem(
                                        sizes: 'lg-6 md-12',
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "price".tr(),
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('price'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('price'),
                                              keyboardType:
                                                  TextInputType.multiline,
                                              decoration: InputDecoration(
                                                hintText: "19.99",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                prefixIcon: MyContainer.none(
                                                    margin: MySpacing.right(12),
                                                    alignment: Alignment.center,
                                                    color: contentTheme.primary
                                                        .withAlpha(40),
                                                    child: MyText.labelLarge(
                                                      "\$",
                                                      color:
                                                          contentTheme.primary,
                                                    )),
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                        maxHeight: 42,
                                                        minWidth: 50,
                                                        maxWidth: 50),
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ]),
                                  MySpacing.height(25),
                                  MyText.labelMedium(
                                    "status".tr(),
                                  ),
                                  MySpacing.height(4),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Wrap(
                                            spacing: 16,
                                            children: Status.values
                                                .map(
                                                  (gender) => InkWell(
                                                    onTap: () => controller
                                                        .onChangeGender(gender),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Radio<Status>(
                                                          value: gender,
                                                          activeColor: theme
                                                              .colorScheme
                                                              .primary,
                                                          groupValue: controller
                                                              .selectedGender,
                                                          onChanged: controller
                                                              .onChangeGender,
                                                          visualDensity:
                                                              getCompactDensity,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                        ),
                                                        MySpacing.width(8),
                                                        MyText.labelMedium(
                                                          gender.name
                                                              .capitalizeWords,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList()),
                                      )
                                    ],
                                  ),
                                  MySpacing.height(25),
                                  MyText.labelMedium(
                                    "tags".tr(),
                                  ),
                                  MySpacing.height(8),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: TextFormField(
                                      maxLines: 3,
                                      validator: controller.basicValidator
                                          .getValidation('tags'),
                                      controller: controller.basicValidator
                                          .getController('tags'),
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        hintText:
                                            "fruits, vegetables, grocery, healthy, etc",
                                        hintStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        contentPadding: MySpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                      ),
                                    ),
                                  ),
                                  MySpacing.height(16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MyButton.text(
                                        onPressed: () {},
                                        padding: MySpacing.xy(20, 16),
                                        splashColor: contentTheme.secondary
                                            .withOpacity(0.1),
                                        child: MyText.bodySmall(
                                          'cancel'.tr(),
                                        ),
                                      ),
                                      MySpacing.width(12),
                                      MyButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        padding: MySpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: MyText.bodySmall(
                                          'save'.tr(),
                                          color: contentTheme.onPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-6',
                      child: MyContainer(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: controller.pickFile,
                              child: MyDottedLine(
                                strokeWidth: 0.2,
                                color: contentTheme.onBackground,
                                corner: MyDottedLineCorner(
                                  leftBottomCorner: 2,
                                  leftTopCorner: 2,
                                  rightBottomCorner: 2,
                                  rightTopCorner: 2,
                                ),
                                child: Center(
                                  heightFactor: 1.5,
                                  child: Padding(
                                    padding: MySpacing.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.cloud_upload_outlined,
                                            size: 22),
                                        MyContainer(
                                          width: 340,
                                          alignment: Alignment.center,
                                          paddingAll: 0,
                                          child: MyText.titleMedium(
                                            "Drop Products here or click to upload.",
                                            fontWeight: 600,
                                            muted: true,
                                            fontSize: 18,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        MyContainer(
                                          alignment: Alignment.center,
                                          width: 610,
                                          child: MyText.titleMedium(
                                            "(This is just a demo dropzone. Selected files are not actually uploaded.)",
                                            muted: true,
                                            fontWeight: 500,
                                            fontSize: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (controller.files.isNotEmpty) ...[
                              MySpacing.height(16),
                              Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: controller.files
                                    .mapIndexed((index, file) =>
                                        MyContainer.bordered(
                                          paddingAll: 8,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              MyContainer(
                                                color: contentTheme.onBackground
                                                    .withAlpha(28),
                                                paddingAll: 8,
                                                child: Icon(
                                                  Icons
                                                      .insert_drive_file_outlined,
                                                  size: 20,
                                                ),
                                              ),
                                              MySpacing.width(16),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  MyText.bodyMedium(
                                                    file.name,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: 600,
                                                  ),
                                                  MyText.bodySmall(Utils
                                                      .getStorageStringFromByte(
                                                          file.bytes?.length ??
                                                              0)),
                                                ],
                                              ),
                                              MySpacing.width(32),
                                              MyContainer.roundBordered(
                                                onTap: () =>
                                                    controller.removeFile(file),
                                                paddingAll: 4,
                                                child: Icon(
                                                  Icons.close,
                                                  size: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              )
                            ],
                            MySpacing.height(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyButton.text(
                                  onPressed: () {},
                                  padding: MySpacing.xy(20, 16),
                                  splashColor:
                                      contentTheme.secondary.withOpacity(0.1),
                                  child: MyText.bodySmall(
                                    'cancel'.tr(),
                                  ),
                                ),
                                MySpacing.width(12),
                                MyButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  padding: MySpacing.xy(20, 16),
                                  backgroundColor: contentTheme.primary,
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                  child: MyText.bodySmall(
                                    'save'.tr(),
                                    color: contentTheme.onPrimary,
                                  ),
                                ),
                              ],
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
}
