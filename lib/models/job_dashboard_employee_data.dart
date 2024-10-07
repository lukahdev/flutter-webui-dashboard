import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webui/helper/services/json_decoder.dart';
import 'package:webui/models/identifier_model.dart';

class JobDashboardEmployeeData extends IdentifierModel {
  final String name, jobTitle, team, performance, status;
  final int salary;
  final DateTime joiningDate;

  JobDashboardEmployeeData(super.id, this.name, this.jobTitle, this.team,
      this.performance, this.status, this.salary, this.joiningDate);

  static JobDashboardEmployeeData fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String jobTitle = decoder.getString('job_title');
    String team = decoder.getString('team');
    String performance = decoder.getString('performance');
    String status = decoder.getString('status');
    int salary = decoder.getInt('salary');
    DateTime joiningDate = decoder.getDateTime('joining_date');

    return JobDashboardEmployeeData(decoder.getId, name, jobTitle, team,
        performance, status, salary, joiningDate);
  }

  static List<JobDashboardEmployeeData> listFromJSON(List<dynamic> list) {
    return list.map((e) => JobDashboardEmployeeData.fromJSON(e)).toList();
  }

  static List<JobDashboardEmployeeData>? _dummyList;

  static Future<List<JobDashboardEmployeeData>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('assets/data/job_dashboard_employee_data.json');
  }
}
