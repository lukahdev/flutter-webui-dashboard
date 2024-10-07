import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webui/helper/services/json_decoder.dart';
import 'package:webui/models/identifier_model.dart';

class TodoModel extends IdentifierModel {
  final String text, priority;
  bool done, important;
  final DateTime createdAt;

  TodoModel(super.id, this.text, this.priority, this.done, this.important,
      this.createdAt);

  static TodoModel fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String text = decoder.getString('text');
    String priority = decoder.getString('priority');
    bool done = decoder.getBool('done');
    bool important = decoder.getBool('important');
    DateTime createdAt = decoder.getDateTime('created_at');

    return TodoModel(decoder.getId, text, priority, done, important, createdAt);
  }

  static List<TodoModel> listFromJSON(List<dynamic> list) {
    return list.map((e) => TodoModel.fromJSON(e)).toList();
  }

  static List<TodoModel>? _dummyList;

  static Future<List<TodoModel>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 10);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/todo_data.json');
  }
}
