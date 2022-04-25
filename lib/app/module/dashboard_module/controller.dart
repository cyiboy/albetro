import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';


enum Show {
 SELECT_CITY,
  SELECT_DATE,
  HOME,
  TRAVELLER,
  FLIGHT_CLASS
}

class DashboardController extends GetxController {

Rx<Show> show =  Show.HOME.obs;
Rx<DateTime> travelDate =  DateTime.now().obs;
RxInt adult = 1.obs;
RxString flightClass = 'Economy'.obs;


changeWidgetShowed({required Show widget}){
  show.value = widget  ;
  print(show.value.toString());
}
closeWidgetShowed(){
  show.value = Show.HOME;
  print(show.value.toString());
}

}
