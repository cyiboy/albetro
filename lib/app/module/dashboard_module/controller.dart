import 'dart:io';

import 'package:albetro/app/data/models/airport_model.dart';
import 'package:albetro/app/data/models/flight_model.dart';
import 'package:albetro/app/module/dashboard_module/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../routes/pages.dart';
import '../../core/utils/responses.dart';
import '../flight_module/repository.dart';


enum Show {
 SELECT_CITY,
  SELECT_DATE,
  HOME,
  TRAVELLER,
  FLIGHT_CLASS
}
enum Airport {
  FROM,
 TO
}

class DashboardController extends GetxController {

Rx<Show> show =  Show.HOME.obs;
Rx<Airport> airportState =  Airport.FROM.obs;
Rx<DateTime> travelDate =  DateTime.now().obs;
RxInt adult = 1.obs;
RxString flightClass = 'Economy'.obs;
Responses _responses = Responses();
RxBool loading = false.obs;
List<dynamic> airport = [].obs;
AirportModel? flyingFrom;
AirportModel? flyingTo;
FlightModel ? flightModel;

TextEditingController city =TextEditingController();

changeWidgetShowed({required Show widget}){
  show.value = widget  ;
  print(show.value.toString());
}
changeWidgetAirport({required Airport widget}){
  airportState.value = widget  ;
  print(airportState.value.toString());
}
closeWidgetShowed(){
  show.value = Show.HOME;
  print(show.value.toString());
  airport = [];
}
getCity() async {
 loading.value = true;
 print('i was caalled');
  _responses = await DashboardRepository.getCity(city.text);
  if (_responses.statusCode == '200') {
    loading.value = false;
    airport.assignAll(_responses.data['response']['airports']);


  } else {
    loading.value = false;
    Get.snackbar(_responses.message ?? 'Error', _responses.data ?? 'Error',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 5));
  }
}

filghtInfo(){
  flightModel = FlightModel(flyingFrom, flyingTo, travelDate.value, adult.value, flightClass.value);
  Get.toNamed( Routes.FLIGHTSEARCH);
}

}
