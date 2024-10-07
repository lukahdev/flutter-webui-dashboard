import 'package:flutter/material.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/utils/my_string_utils.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/models/todo_model.dart';
import 'package:webui/views/apps/todo/todo_cache.dart';

enum Priority {
  high,
  medium,
  low;

  const Priority();
}

class TodoController extends MyController {
  int isSelect = 0;
  List<TodoModel> todo = [];
  late Priority _priority;
  late TextEditingController titleTE;
  MyFormValidator basicValidator = MyFormValidator();
  ScrollController? scrollController;
  GlobalKey<ScaffoldState> key = GlobalKey();

  void onChangeTab(int index) {
    isSelect = index;
    update();
  }

  void removeData(index) {
    todo.remove(index);
    TodoCache.deleteTodo.add(index);
    update();
  }

  undoData(index) {
    TodoCache.deleteTodo.removeAt(index);
    update();
  }

  void addTodoList() {
    if (basicValidator.validateForm()) {
      todo.add(TodoModel(
        -1,
        titleTE.text,
        _priority.name,
        false,
        false,
        DateTime.now(),
      ));
      titleTE.clear();
      scrollToBottom(isDelayed: true);
      update();
    }
  }

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter title";
    } else if (!MyStringUtils.validateStringRange(text, 3, 100)) {
      return "Password length must between 3 and 100";
    }
    return null;
  }

  void onSelectPriority(Priority priority) {
    _priority = priority;
    update();
  }

  scrollToBottom({bool isDelayed = false}) {
    final int delay = isDelayed ? 400 : 0;
    Future.delayed(Duration(milliseconds: delay), () {
      scrollController!.animateTo(scrollController!.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutCubicEmphasized);
    });
  }

  @override
  void onInit() {
    TodoModel.dummyList.then((value) {
      todo = value;
      update();
    });
    titleTE = TextEditingController(text: 'Launch New App for Flutter');
    scrollController = ScrollController();
    _priority = Priority.values[0];
    super.onInit();
  }
}
