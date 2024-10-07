import 'package:flutter/material.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/models/job_vacancy.dart';

class JobType {
  String name;
  bool isChecked;

  JobType(this.name, {this.isChecked = false});
}

class JobCategories {
  String name;
  bool isChecked;

  JobCategories(this.name, {this.isChecked = false});
}

class JobExperience {
  String name;
  bool isChecked;

  JobExperience(this.name, {this.isChecked = false});
}

class JobVacancyController extends MyController {
  List<JobVacancy> jobVacancy = [];

  final List<JobType> jobType = [
    JobType('Full-time'),
    JobType('InternShip'),
    JobType('Part-Time'),
    JobType('Freelancer'),
  ];

  final List<JobCategories> jobCategories = [
    JobCategories("Business Development / Sales"),
    JobCategories("Marketing"),
    JobCategories("Software Engineering"),
    JobCategories("Finance"),
  ];

  final List<JobExperience> jobExperience = [
    JobExperience("Beginner"),
    JobExperience("Intermediate"),
    JobExperience("Expert"),
  ];

  @override
  void onInit() {
    super.onInit();
    JobVacancy.dummyList.then((value) {
      jobVacancy = value;
      update();
    });
  }

  bool sticky = false, isSwitch = false;
  RangeValues rangeSlider = RangeValues(20, 40);

  void onChangeRangeSlider(RangeValues value) {
    rangeSlider = value;
    update();
  }

  void onChangeSticky(bool? value) {
    if (value != null) {
      sticky = value;
      update();
    }
  }
}
