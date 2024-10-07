import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/controller/error_pages/error_500_controller.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_text.dart';

class Error500 extends StatefulWidget {
  const Error500({super.key});

  @override
  State<Error500> createState() => _Error500State();
}

class _Error500State extends State<Error500>
    with SingleTickerProviderStateMixin, UIMixin {
  late Error500Controller controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(Error500Controller());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(LucideIcons.shield_alert, size: 80),
                MyText.bodyMedium(
                  "Error 500",
                  fontSize: 52,
                ),
                MyText.bodyMedium(
                  "Internal Server error",
                  fontSize: 24,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
