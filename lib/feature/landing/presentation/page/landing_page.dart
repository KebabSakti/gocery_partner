import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/feature/landing/presentation/controller/landing_page_controller.dart';

class LandingPage extends GetView<LandingPageController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kLightColor,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
