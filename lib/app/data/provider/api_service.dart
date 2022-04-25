import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http_parser/http_parser.dart';



class ApiProvider {
  final String _baseUrl = "https://api.idsure.io/";
  HttpClient client = new HttpClient();
 // with default Options

// Set default configs
  // ignore: empty_constructor_bodies

  // Future<dynamic> login(String email, String password) async {
  //   var responseJson;
  //   try {
  //     print(email + password);
  //
  //     final response = await http.post(
  //       Uri.parse(_baseUrl + 'v1/signin'),
  //       headers: {"Content-Type": "application/x-www-form-urlencoded"},
  //       body: {
  //         "Email": email,
  //         "Password": password,
  //       },
  //       encoding: Encoding.getByName('utf-8'),
  //     );
  //     print(response.statusCode);
  //     print(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       responseJson = Responses(
  //           statusCode: '200',
  //           data: jsonDecode(response.body),
  //           message: 'success');
  //     } else {
  //       responseJson = Responses(
  //           statusCode: response.statusCode.toString(),
  //           message: jsonDecode(response.body)['Email'] ??
  //               jsonDecode(response.body)['Password']);
  //     }
  //   } on SocketException {
  //     responseJson = Responses(
  //         message: "No Internet connection, try again",
  //         statusCode: "502",
  //         data: "502"
  //     );
  //   }
  //   return responseJson;
  // }

}
