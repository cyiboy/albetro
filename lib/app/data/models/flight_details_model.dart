class FlightDetailModel{
 String? _path;
  String? _time;
  String? _date;
  String? _airline;
  String? _price;

 FlightDetailModel(
      this._path, this._time, this._date, this._airline, this._price);

 String? get price => _price;

  String? get airline => _airline;

  String? get date => _date;

  String? get time => _time;

  String? get path => _path;
}