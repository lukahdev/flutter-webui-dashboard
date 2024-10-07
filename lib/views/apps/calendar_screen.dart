import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:webui/controller/apps/calendar_controller.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late CalenderController controller;

  @override
  void initState() {
    controller = Get.put(CalenderController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
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
                      "Calender",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Apps"),
                        MyBreadcrumbItem(name: "Calender", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: 'lg-3',
                      child: MyContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyButton.block(
                                elevation: 0.5,
                                onPressed: () {},
                                backgroundColor: contentTheme.primary,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LucideIcons.plus,
                                      color: contentTheme.onPrimary,
                                    ),
                                    MySpacing.width(12),
                                    MyText.bodyMedium(
                                      'Create New Event',
                                      color: contentTheme.onPrimary,
                                    ),
                                  ],
                                )),
                            MySpacing.height(12),
                            MyText.bodyMedium(
                                'Drag and drop your event or click in the calendar'),
                            MySpacing.height(12),
                            buildEventButtons(LucideIcons.circle,
                                contentTheme.secondary, 'New Theme Release'),
                            MySpacing.height(12),
                            buildEventButtons(LucideIcons.circle,
                                contentTheme.blue, 'My Event'),
                            MySpacing.height(12),
                            buildEventButtons(LucideIcons.circle,
                                contentTheme.warning, 'Meet Manager'),
                            MySpacing.height(12),
                            buildEventButtons(LucideIcons.circle,
                                contentTheme.danger, 'Create New Theme'),
                            MySpacing.height(20),
                            MyText.bodyMedium(
                              'How It Work?',
                              fontWeight: 600,
                            ),
                            MySpacing.height(16),
                            MyText.bodyMedium(controller.dummyTexts[2]),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-9',
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        height: 700,
                        child: SfCalendar(
                          view: CalendarView.week,
                          allowedViews: const [
                            CalendarView.day,
                            CalendarView.week,
                            CalendarView.month,
                          ],
                          dataSource: controller.events,
                          allowDragAndDrop: true,
                          allowAppointmentResize: true,
                          onDragEnd: controller.dragEnd,
                          monthViewSettings: const MonthViewSettings(
                            showAgenda: true,
                          ),
                          controller: CalendarController(),
                          allowViewNavigation: true,
                          showTodayButton: true,
                          showCurrentTimeIndicator: true,
                          showNavigationArrow: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildEventButtons(IconData icon, Color color, String eventName) {
    return MyButton.block(
        elevation: 0.5,
        onPressed: () {},
        backgroundColor: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: contentTheme.onPrimary,
            ),
            MySpacing.width(12),
            MyText.bodyMedium(
              eventName,
              color: contentTheme.onPrimary,
            ),
          ],
        ));
  }
}
