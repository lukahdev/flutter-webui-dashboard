import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webui/helper/services/json_decoder.dart';
import 'package:webui/images.dart';
import 'package:webui/models/identifier_model.dart';

class JobVacancy extends IdentifierModel {
  final String companyName, appName, location, image;
  final int years, amount;
  final double progress;

  JobVacancy(
    super.id,
    this.companyName,
    this.appName,
    this.location,
    this.image,
    this.years,
    this.amount,
    this.progress,
  );

  static JobVacancy fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String companyName = decoder.getString('company_name');
    String appName = decoder.getString('app_name');
    String location = decoder.getString('location');
    String image = Images.randomImage(Images.avatars);
    int years = decoder.getInt('years');
    int amount = decoder.getInt('amount');
    double progress = decoder.getDouble('progress');

    return JobVacancy(
      decoder.getId,
      companyName,
      appName,
      location,
      image,
      years,
      amount,
      progress,
    );
  }

  static List<JobVacancy> listFromJSON(List<dynamic> list) {
    return list.map((e) => JobVacancy.fromJSON(e)).toList();
  }

  static List<JobVacancy>? _dummyList;

  static Future<List<JobVacancy>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 14);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/job_vacancy.json');
  }
}
