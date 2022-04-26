import 'dart:io';
import 'dart:typed_data';

import 'package:albetro/app/core/p.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import '../../core/utils/responses.dart';



class ApiProvider {
  final String _airLabBaseUrl = "https://airlabs.co/api/v9/";
  final String _airLabKey = "https://airlabs.co/api/v9/8bd89b9c-ab4c-4447-b39c-a8910eb4bc1c";
  HttpClient client = new HttpClient();


  Future<dynamic> getCity(String city,) async {
    var responseJson;
    try {

      final response = await http.get(
        Uri.parse(_airLabBaseUrl + 'suggest?q='+city+'&api_key='+_airLabKey),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},


      );

      if (response.statusCode == 200) {
        responseJson = Responses(
            statusCode: '200',
            data: jsonDecode(response.body),
            message: 'success');
      } else {
        responseJson = Responses(
            statusCode: response.statusCode.toString(),
            message: jsonDecode(response.body) );
      }
    } on SocketException {
      responseJson = Responses(
          message: "No Internet connection, try again",
          statusCode: "502",
          data: "502"
      );
    }
    return responseJson;
  }
  Future<dynamic> getFlight() async {
    var responseJson;
    String dep_iata =P.dashboard.flyingFrom!.iata_code!;
    String arr_iata =P.dashboard.flyingTo!.iata_code!;
    try {

      final response = await http.get(
        Uri.parse(_airLabBaseUrl + 'schedules?dep_iata='+dep_iata+'&arr_iata='+arr_iata+'&api_key='+_airLabKey),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},



      );

      if (response.statusCode == 200) {
        responseJson = Responses(
            statusCode: '200',
            data: jsonDecode(response.body),
            message: 'success');
      } else {
        responseJson = Responses(
            statusCode: response.statusCode.toString(),
            message: jsonDecode(response.body) );
      }
    } on SocketException {
      responseJson = Responses(
          message: "No Internet connection, try again",
          statusCode: "502",
          data: "502"
      );
    }
    return responseJson;
  }


  Future<dynamic> getAirline(iata) async {
    var responseJson;

    try {

      final response = await http.get(
        Uri.parse(_airLabBaseUrl + 'airlines?iata_code='+iata+'&api_key='+_airLabKey),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
      );

      if (response.statusCode == 200) {
        responseJson = Responses(
            statusCode: '200',
            data: jsonDecode(response.body),
            message: 'success');
      } else {
        responseJson = Responses(
            statusCode: response.statusCode.toString(),
            message: jsonDecode(response.body) );
      }
    } on SocketException {
      responseJson = Responses(
          message: "No Internet connection, try again",
          statusCode: "502",
          data: "502"
      );
    }
    return responseJson;
  }
}
