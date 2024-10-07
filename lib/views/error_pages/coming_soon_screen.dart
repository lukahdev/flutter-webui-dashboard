import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/error_pages/coming_soon_controller.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';

class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ComingSoonController controller;

  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 15);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    if (mounted) {
      final reduceSecondsBy = 1;
      setState(() {
        final seconds = myDuration.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countdownTimer!.cancel();
        } else {
          myDuration = Duration(seconds: seconds);
        }
      });
    }
  }

  @override
  void initState() {
    controller = Get.put(ComingSoonController());
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    debugPrint("$days : $hours : $minutes : $seconds");
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    const Icon(
                      LucideIcons.rocket,
                      size: 52,
                    ),
                    MySpacing.height(24),
                    MyText.titleLarge(
                      "WE'RE COMING SOON",
                      fontSize: 52,
                    ),
                    MySpacing.height(8),
                    MyText.titleMedium(
                      "Something Started forming, and will take shape soon.",
                    ),
                    MySpacing.height(24),
                    Wrap(
                      runSpacing: 12,
                      spacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        MyContainer(
                          height: 100,
                          width: 100,
                          paddingAll: 0,
                          child: Center(
                              child: MyText.titleLarge(
                            days,
                            fontSize: 32,
                          )),
                        ),
                        MyText.bodyLarge(
                          ':',
                          fontSize: 30,
                          fontWeight: 600,
                        ),
                        MyContainer(
                          height: 100,
                          width: 100,
                          paddingAll: 0,
                          child: Center(
                              child: MyText.titleLarge(
                            hours,
                            fontSize: 32,
                          )),
                        ),
                        MyText.bodyLarge(
                          ':',
                          fontSize: 30,
                          fontWeight: 600,
                        ),
                        MyContainer(
                          height: 100,
                          width: 100,
                          paddingAll: 0,
                          child: Center(
                              child: MyText.titleLarge(
                            minutes,
                            fontSize: 32,
                          )),
                        ),
                        MyText.bodyLarge(
                          ':',
                          fontSize: 30,
                          fontWeight: 600,
                        ),
                        MyContainer(
                          height: 100,
                          width: 100,
                          paddingAll: 0,
                          child: Center(
                              child: MyText.titleLarge(
                            seconds,
                            fontSize: 32,
                          )),
                        ),
                      ],
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
