import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/apps/todo/todo_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/utils/utils.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/apps/todo/deleted_todo__screen.dart';
import 'package:webui/views/apps/todo/done_todo_screen.dart';
import 'package:webui/views/apps/todo/important_todo_screen.dart';
import 'package:webui/views/apps/todo/todo_cache.dart';
import 'package:webui/views/layout/layout.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late TodoController controller;
  late OutlineInputBorder outlineBorder;

  @override
  void initState() {
    outlineBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none);
    controller = Get.put(TodoController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        tag: 'todo_controller',
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Todo",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Apps'),
                        MyBreadcrumbItem(name: 'Todo', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: Column(
                  children: [
                    MyFlex(
                      children: [
                        MyFlexItem(
                          sizes: 'lg-3',
                          child: MyContainer(
                            borderRadiusAll: 8,
                            height: 600,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: buildTodoIndex(),
                          ),
                        ),
                        MyFlexItem(
                          sizes: 'lg-9',
                          child: MyContainer(
                            height: 600,
                            borderRadiusAll: 8,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(LucideIcons.clipboard_list, size: 20),
                                    MySpacing.width(12),
                                    Expanded(
                                        child: MyText.titleMedium(
                                      controller.isSelect == 0
                                          ? "Task List"
                                          : controller.isSelect == 1
                                              ? "Done Task"
                                              : controller.isSelect == 2
                                                  ? "Important Task"
                                                  : controller.isSelect == 3
                                                      ? "Deleted Task"
                                                      : "",
                                      fontWeight: 600,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                  ],
                                ),
                                Divider(height: 28),
                                controller.isSelect == 0
                                    ? buildListView()
                                    : controller.isSelect == 1
                                        ? DoneTodoScreen()
                                        : controller.isSelect == 2
                                            ? ImportantTodoScreen()
                                            : controller.isSelect == 3
                                                ? DeletedTodoScreen()
                                                : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget buildListView() {
    return Expanded(
      child: controller.todo.isEmpty
          ? Center(
              child: MyText.bodyMedium("List Data Is Empty", fontWeight: 600))
          : ListView.separated(
              itemCount: controller.todo.length,
              controller: controller.scrollController,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shrinkWrap: true,
              padding: MySpacing.x(8),
              itemBuilder: (context, index) {
                var todo = controller.todo[index];

                /// Done Task
                TodoCache.doneTodo = [];
                for (int i = 0; i < controller.todo.length; i++) {
                  if (controller.todo[i].done == true) {
                    TodoCache.doneTodo.add(controller.todo[i]);
                  }
                }

                /// Important Task
                TodoCache.importantTodo = [];
                for (int i = 0; i < controller.todo.length; i++) {
                  if (controller.todo[i].important == true) {
                    TodoCache.importantTodo.add(controller.todo[i]);
                  }
                }

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
                          case 'Complete':
                            todo.done = !todo.done;
                            TodoCache.doneTodo.add(todo);
                            ScaffoldMessenger.of(context).showSnackBar(
                                buildSnackBar(todo.done
                                    ? "Task Complete"
                                    : "Task InComplete"));
                            setState(() {});
                            break;

                          case 'Important':
                            todo.important = !todo.important;
                            TodoCache.importantTodo.add(todo);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(buildSnackBar(
                              todo.important
                                  ? "Important Task"
                                  : "UnImportant Task",
                            ));
                            setState(() {});
                            break;

                          case 'Delete':
                            //Delete Date

                            controller.removeData(todo);
                            setState(() {});
                            break;
                        }
                      },
                      offset: Offset(0, 20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      tooltip: 'Actions',
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                            value: 'Complete',
                            padding: MySpacing.xy(16, 8),
                            height: 10,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  LucideIcons.thumbs_up,
                                  size: 16,
                                ),
                                MySpacing.width(8),
                                MyText.bodySmall(
                                  todo.done
                                      ? "Mark Incomplete"
                                      : "Mark Completed",
                                  fontWeight: 600,
                                ),
                              ],
                            )),
                        PopupMenuItem(
                            value: 'Important',
                            padding: MySpacing.xy(16, 8),
                            height: 10,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  LucideIcons.star,
                                  size: 16,
                                ),
                                MySpacing.width(8),
                                MyText.bodySmall(
                                  !todo.important ? 'Important' : 'UnImportant',
                                  fontWeight: 600,
                                )
                              ],
                            )),
                        PopupMenuItem(
                            value: 'Delete',
                            padding: MySpacing.xy(16, 8),
                            height: 10,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  LucideIcons.trash_2,
                                  size: 16,
                                ),
                                MySpacing.width(8),
                                MyText.bodySmall("Delete", fontWeight: 600)
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

  Widget buildTodoIndex() {
    Widget buildIndexDetail(
        IconData icon, String title, count, Color color, int id) {
      return InkWell(
        onTap: () => controller.onChangeTab(id),
        child: Row(
          children: [
            MyContainer.rounded(
              paddingAll: 0,
              height: 40,
              width: 40,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: color.withAlpha(36),
              child: Icon(
                icon,
                size: 20,
                color: color,
              ),
            ),
            MySpacing.width(20),
            MyText.bodyMedium(title, fontWeight: 600),
            Spacer(),
            MyContainer(
              paddingAll: 0,
              height: 24,
              width: 24,
              borderRadiusAll: 6,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: color.withAlpha(36),
              child: Center(
                  child: MyText.bodySmall(
                count,
                fontWeight: 600,
                color: color,
              )),
            )
          ],
        ),
      );
    }

    Widget title(IconData icon, String title) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          MySpacing.width(12),
          Expanded(
              child: MyText.titleMedium(
            title,
            fontWeight: 600,
            overflow: TextOverflow.ellipsis,
          )),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(LucideIcons.clipboard_list, 'Task List'),
        Divider(height: 32),
        buildIndexDetail(LucideIcons.list_checks, "List",
            controller.todo.length.toString(), contentTheme.success, 0),
        MySpacing.height(12),
        buildIndexDetail(LucideIcons.thumbs_up, "Done",
            TodoCache.doneTodo.length.toString(), contentTheme.blue, 1),
        MySpacing.height(12),
        buildIndexDetail(LucideIcons.star, "Important",
            TodoCache.importantTodo.length.toString(), contentTheme.info, 2),
        MySpacing.height(12),
        buildIndexDetail(LucideIcons.trash_2, "Deleted",
            TodoCache.deleteTodo.length.toString(), contentTheme.danger, 3),
        MySpacing.height(12),
        Divider(height: 32),
        title(LucideIcons.clipboard_paste, 'Create Task'),
        Divider(height: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.bodyMedium("Title", fontWeight: 600),
            MySpacing.height(4),
            Form(
              key: controller.basicValidator.formKey,
              child: TextFormField(
                controller: controller.titleTE,
                validator: controller.validateName,
                style: MyTextStyle.bodyMedium(fontWeight: 600),
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  contentPadding: MySpacing.all(12),
                  hintText: "Enter title",
                  hintStyle: MyTextStyle.bodyMedium(fontWeight: 600),
                  disabledBorder: outlineBorder,
                  enabledBorder: outlineBorder,
                  errorBorder: outlineBorder,
                  focusedBorder: outlineBorder,
                  focusedErrorBorder: outlineBorder,
                  border: outlineBorder,
                ),
              ),
            ),
          ],
        ),
        MySpacing.height(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.bodyMedium("Priority", fontWeight: 600),
            MySpacing.height(4),
            DropdownButtonFormField<Priority>(
              dropdownColor: contentTheme.background,
              menuMaxHeight: 200,
              isDense: true,
              items: Priority.values
                  .map(
                    (priority) => DropdownMenuItem<Priority>(
                      onTap: () {
                        controller.onSelectPriority(priority);
                      },
                      value: priority,
                      child: MyText.labelMedium(
                        priority.name.capitalizeWords,
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
                hintStyle: MyTextStyle.bodyMedium(),
                disabledBorder: outlineBorder,
                enabledBorder: outlineBorder,
                errorBorder: outlineBorder,
                focusedBorder: outlineBorder,
                focusedErrorBorder: outlineBorder,
                border: outlineBorder,
                contentPadding: MySpacing.all(12),
                isCollapsed: true,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              onChanged: controller.basicValidator.onChanged<Object?>(
                'priority',
              ),
            ),
          ],
        ),
        Spacer(),
        MyButton.block(
            onPressed: () => controller.addTodoList(),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: 8,
            elevation: 0,
            child: MyText.bodyMedium(
              "Add New Task",
              color: contentTheme.onPrimary,
              fontWeight: 600,
            ))
      ],
    );
  }
}
