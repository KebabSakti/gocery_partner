import 'package:get/get.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/feature/home/presentation/controller/home_page_controller.dart';
import 'package:gocery_partner/feature/home/presentation/page/home_page.dart';
import 'package:gocery_partner/feature/intro/presentation/controller/intro_page_controller.dart';
import 'package:gocery_partner/feature/intro/presentation/page/intro_page.dart';
import 'package:gocery_partner/feature/landing/presentation/controller/landing_page_controller.dart';
import 'package:gocery_partner/feature/landing/presentation/page/landing_page.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: kLandingPage,
      page: () => const LandingPage(),
      binding: BindingsBuilder.put(() => LandingPageController()),
    ),
    GetPage(
      name: kIntroPage,
      page: () => const IntroPage(),
      binding: BindingsBuilder.put(() => IntroPageController()),
    ),
    GetPage(
      name: kHomePage,
      page: () => const HomePage(),
      binding: BindingsBuilder.put(() => HomePageController()),
    ),
  ];
}
