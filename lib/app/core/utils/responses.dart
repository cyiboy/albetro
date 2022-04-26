class Responses {
  String? _message;
  String? _statusCode;
  var _data;



  String? get message => _message;

  get data => _data;
  String? get statusCode => _statusCode;

  Responses({  String? message, String ? statusCode,    data}) {
    _message = message;

    _data = data;
    _statusCode = statusCode;
  }
  Responses.fromJson(dynamic json) {

    _message = json['message'] ;
    _data  = json['data'] ;
    _statusCode =  json['status'];
  }



}
