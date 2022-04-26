import 'dart:collection';

import 'package:albetro/app/module/flight_module/processing.dart';
import 'package:albetro/app/module/flight_module/flight_details.dart';
import 'package:albetro/app/module/flight_module/flight_search_screen.dart';
import 'package:albetro/app/module/flight_module/pay_by_card.dart';
import 'package:albetro/app/module/flight_module/review_and_pay.dart';
import 'package:albetro/app/module/flight_module/traveller_details.dart';
import 'package:albetro/app/module/flight_module/view_map.dart';
import 'package:albetro/app/module/trip_module/trip_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../app/module/dashboard_module/dashboard_screen.dart';

part './routes.dart';

class AppPages {
  static final pages = [

    GetPage(name: Routes.DASHBOARD, page: () => DashboardScreen()),
    GetPage(name: Routes.FLIGHTSEARCH, page: () => FlightSearch()),
    GetPage(name: Routes.FLIGHTDETAILS, page: () => FlightDetails()),
    GetPage(name: Routes.TRAVELLERDETAILS, page: () => TravellersDetails()),
    GetPage(name: Routes.PAYCARD, page: () => PayCard()),
    GetPage(name: Routes.PROCESSING, page: () => Processing()),
    GetPage(name: Routes.REVIEWPAY, page: () => ReviewPay()),
    GetPage(name: Routes.TRIPDETAILS, page: () => TripInfo()),
    GetPage(name: Routes.MAPVIEW, page: () => ViewMap()),
  ];
}
