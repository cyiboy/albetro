import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';



class FlightController extends GetxController {

TextEditingController nationality =  TextEditingController();
TextEditingController inssuing_country =  TextEditingController();
TextEditingController dob =  TextEditingController();
TextEditingController expiry =  TextEditingController();
TextEditingController expiry_card =  TextEditingController();
RxBool loading = true.obs;

Future<void> delayedMove({int milli = 2000, String? to}) async {
  await Future.delayed(Duration(milliseconds: milli));
  loading.value = false;
}

}
