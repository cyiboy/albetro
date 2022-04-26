

class AirportModel{




  String? _iata_code;
  String? _name;
  String? _icao_code;
  double? _lat;
  double? _lng;
  String? _slug;

  String? get iata_code => _iata_code;

  String? get name => _name;

  String? get slug => _slug;

  double? get lng => _lng;

  double? get lat => _lat;

  String? get icao_code => _icao_code;

  AirportModel(this._iata_code, this._name, this._icao_code, this._lat,
      this._lng, this._slug);

  AirportModel.fromJson(dynamic json) {

    _iata_code = json['iata_code'] ;
    _name  = json['name'] ;
    _icao_code =  json['icao_code'];
    _lat =  json['lat'];
    _lng =  json['lng'];
    _slug = json['slug'];
    _name =  json['name'];
  }
}