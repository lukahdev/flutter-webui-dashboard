import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/apps/jobs/job_candidate_controller.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/layout.dart';

class JobCandidatePage extends StatefulWidget {
  const JobCandidatePage({super.key});

  @override
  State<JobCandidatePage> createState() => _JobCandidatePageState();
}

class _JobCandidatePageState extends State<JobCandidatePage>
    with SingleTickerProviderStateMixin, UIMixin {
  late JobCandidateController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(JobCandidateController());
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
                      "Job Candidate",
                      fontWeight: 600,
                      fontSize: 18,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "UI"),
                        MyBreadcrumbItem(name: "Job Candidate", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runSpacing: 16,
                      spacing: 16,
                      children: [
                        MyContainer.none(
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: theme.cardTheme.color,
                              prefixIcon: Icon(
                                Icons.search,
                                size: 18,
                              ),
                              isDense: true,
                              hintText: "Search Files",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: MySpacing.horizontal(20),
                            ),
                          ),
                        ),
                        MyContainer.none(
                          width: 250,
                          child: PopupMenuButton(
                              onSelected: controller.onSelectedJob,
                              itemBuilder: (BuildContext context) {
                                return [
                                  "Select Job",
                                  "Engineer",
                                  "Developer",
                                  "Artist",
                                  "Lawyer"
                                ].map((behavior) {
                                  return PopupMenuItem(
                                    value: behavior,
                                    height: 32,
                                    child: MyText.bodySmall(
                                      behavior.toString(),
                                      fontWeight: 600,
                                    ),
                                  );
                                }).toList();
                              },
                              color: theme.cardTheme.color,
                              child: MyContainer.none(
                                padding: MySpacing.xy(12, 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    MyText.labelMedium(
                                      controller.selectJob.toString(),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: Icon(
                                        Icons.expand_more_outlined,
                                        size: 22,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        MyContainer.none(
                          width: 250,
                          child: PopupMenuButton(
                              onSelected: controller.onSelectedRating,
                              itemBuilder: (BuildContext context) {
                                return [
                                  "Select Rating",
                                  "Ok",
                                  "Good",
                                  "Better",
                                  "Best",
                                  "Excellent",
                                ].map((behavior) {
                                  return PopupMenuItem(
                                    value: behavior,
                                    height: 32,
                                    child: MyText.bodySmall(
                                      behavior.toString(),
                                      fontWeight: 600,
                                    ),
                                  );
                                }).toList();
                              },
                              color: theme.cardTheme.color,
                              child: MyContainer.none(
                                padding: MySpacing.xy(12, 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    MyText.labelMedium(
                                      controller.selectRating.toString(),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: Icon(
                                        Icons.expand_more_outlined,
                                        size: 22,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                    MySpacing.height(flexSpacing),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 255,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 270,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      itemCount: controller.jobCandidate.length,
                      itemBuilder: (context, index) {
                        return MyCard(
                          paddingAll: 0,
                          shadow: MyShadow(elevation: 0.5),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: MySpacing.xy(16, 16),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: MyContainer.none(
                                    borderRadiusAll: 22,
                                    width: 45,
                                    height: 20,
                                    color: contentTheme.primary.withAlpha(40),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star_outline,
                                          size: 16,
                                          color: AppColors.star,
                                        ),
                                        MySpacing.width(4),
                                        MyText.bodyMedium(
                                          "${controller.jobCandidate[index].rating}",
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: MySpacing.y(26),
                                child: Column(
                                  children: [
                                    MyContainer(
                                      paddingAll: 0,
                                      borderRadiusAll: 8,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        Images.avatars[
                                            index % Images.avatars.length],
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    MySpacing.height(12),
                                    Padding(
                                      padding: MySpacing.x(12),
                                      child: MyText.titleSmall(
                                        controller.jobCandidate[index].jobTitle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    MySpacing.height(8),
                                    MyText.titleSmall(
                                      controller.jobCandidate[index].appName,
                                    ),
                                    MySpacing.height(12),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'View Detail',
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
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
