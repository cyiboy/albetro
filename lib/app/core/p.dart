import 'package:albetro/app/module/flight_module/controller.dart';
import 'package:get/get.dart';

import '../module/dashboard_module/controller.dart';
import '../module/splash_screen/controller.dart';


class P {
  static initialize() {
    Get.put(SplashController());
    Get.put(DashboardController());
    Get.put(FlightController());

  }

  static SplashController get splash => Get.find();
  static DashboardController get dashboard => Get.find();
  static FlightController get flight => Get.find();
}
