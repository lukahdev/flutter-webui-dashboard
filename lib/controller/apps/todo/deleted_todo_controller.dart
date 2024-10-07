import 'package:get/get.dart';
import 'package:webui/views/apps/todo/todo_cache.dart';

class DeletedTodoController extends GetxController {
  void onPermanentDelete(id) {
    TodoCache.deleteTodo.remove(id);
    update();
  }

  void removeData() {}
}
