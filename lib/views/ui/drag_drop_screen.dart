import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/ui/drag_drop_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_list_extension.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class DragDropScreen extends StatefulWidget {
  const DragDropScreen({super.key});

  @override
  State<DragDropScreen> createState() => _DragDropScreenState();
}

class _DragDropScreenState extends State<DragDropScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late DragDropController controller;

  @override
  void initState() {
    controller = Get.put(DragDropController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
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
                      "${"drag".tr()} & ${"drop".tr()}",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ui'.tr()),
                        MyBreadcrumbItem(
                            name: "${"drag".tr()} & ${"drop".tr()}",
                            active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                  padding: MySpacing.x(flexSpacing),
                  child: MyCard(
                    shadow: MyShadow(elevation: 0.5),
                    width: MediaQuery.of(context).size.width,
                    padding: MySpacing.xy(20, 20),
                    child: ReorderableListView(
                      proxyDecorator: (child, index, animation) {
                        return Material(
                          child: MyCard(
                            shadow: MyShadow(elevation: 0.5),
                            paddingAll: 0,
                            child: child,
                          ),
                        );
                      },
                      buildDefaultDragHandles: false,
                      shrinkWrap: true,
                      onReorder: controller.onReorder,
                      children: controller.customers
                          .mapIndexed((index, element) => ListTile(
                                key: Key('$index'),
                                leading: ReorderableDragStartListener(
                                    index: index,
                                    child: MouseRegion(
                                        cursor: SystemMouseCursors.grabbing,
                                        child: Icon(
                                          LucideIcons.grip_vertical,
                                          size: 20,
                                        ))),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: MyText.labelMedium(
                                        ' ${element.fullName}',
                                      ),
                                    ),
                                    Expanded(
                                      child: MyText.labelMedium(
                                          ' ${element.phoneNumber}',
                                          textAlign: TextAlign.start),
                                    ),
                                    Expanded(
                                      child: MyText.labelMedium(
                                          ' ${element.balance}'),
                                    ),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 100),
                                      child: Icon(
                                        LucideIcons.trash_2,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
