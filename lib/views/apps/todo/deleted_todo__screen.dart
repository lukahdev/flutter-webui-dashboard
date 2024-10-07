import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/apps/todo/deleted_todo_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/utils/utils.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/views/apps/todo/todo_cache.dart';

class DeletedTodoScreen extends StatefulWidget {
  const DeletedTodoScreen({super.key});

  @override
  State<DeletedTodoScreen> createState() => _DeletedTodoScreenState();
}

class _DeletedTodoScreenState extends State<DeletedTodoScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late DeletedTodoController controller;

  @override
  void initState() {
    controller = DeletedTodoController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'deleted_todo_controller',
      builder: (controller) {
        return Expanded(
          child: TodoCache.deleteTodo.isEmpty
              ? Center(
                  child: MyText.bodyMedium("Delete Data Is Empty",
                      fontWeight: 600))
              : ListView.separated(
                  itemCount: TodoCache.deleteTodo.length,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shrinkWrap: true,
                  padding: MySpacing.x(8),
                  itemBuilder: (context, index) {
                    var todo = TodoCache.deleteTodo[index];

                    return Row(
                      children: [
                        Icon(
                            todo.important
                                ? LucideIcons.sparkle
                                : LucideIcons.circle_dot,
                            size: 20),
                        MySpacing.width(12),
                        Expanded(
                          child: MyText.bodyMedium(
                            todo.text,
                            fontWeight: 600,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            decoration: todo.done
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        MySpacing.width(12),
                        MyContainer(
                          padding: MySpacing.xy(8, 4),
                          borderRadiusAll: 4,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: todo.priority == 'high'
                              ? contentTheme.danger.withAlpha(40)
                              : todo.priority == 'medium'
                                  ? contentTheme.warning.withAlpha(40)
                                  : todo.priority == 'low'
                                      ? contentTheme.success.withAlpha(40)
                                      : null,
                          child: Center(
                            child: MyText(
                              todo.priority.capitalizeWords,
                              fontSize: 11,
                              fontWeight: 600,
                              color: todo.priority == 'high'
                                  ? contentTheme.danger
                                  : todo.priority == 'medium'
                                      ? contentTheme.warning
                                      : todo.priority == 'low'
                                          ? contentTheme.success
                                          : null,
                              decoration: todo.done
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        ),
                        MySpacing.width(16),
                        MyText(
                          '${Utils.getDateStringFromDateTime(todo.createdAt)}',
                          fontSize: 11,
                          fontWeight: 600,
                          decoration: todo.done
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                        MySpacing.width(16),
                        PopupMenuButton(
                          onSelected: (value) {
                            switch (value) {
                              case 'remove':
                                break;

                              case 'Permanent Delete':
                                controller.onPermanentDelete(todo);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    buildSnackBar("Permanent Delete"));
                                setState(() {});
                                break;
                            }
                          },
                          offset: Offset(0, 20),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          tooltip: 'Actions',
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                                value: 'Permanent Delete',
                                padding: MySpacing.xy(16, 8),
                                height: 10,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LucideIcons.trash,
                                      size: 16,
                                    ),
                                    MySpacing.width(8),
                                    MyText.bodySmall(
                                      "Permanent Delete",
                                      fontWeight: 600,
                                    )
                                  ],
                                )),
                            PopupMenuItem(
                                value: 'reStore',
                                padding: MySpacing.xy(16, 8),
                                height: 10,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LucideIcons.archive_restore,
                                      size: 16,
                                    ),
                                    MySpacing.width(8),
                                    MyText.bodySmall("ReStore", fontWeight: 600)
                                  ],
                                )),
                          ],
                          child: Icon(
                            LucideIcons.ellipsis_vertical,
                            size: 20,
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                ),
        );
      },
    );
  }

  SnackBar buildSnackBar(String msg) {
    return SnackBar(
      content: Text(
        msg,
      ),
      dismissDirection: DismissDirection.up,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      behavior: SnackBarBehavior.floating,
      backgroundColor: contentTheme.primary,
      elevation: 0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      width: 300,
    );
  }
}
