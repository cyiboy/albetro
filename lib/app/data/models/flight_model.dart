

import 'package:albetro/app/data/models/airport_model.dart';
import 'package:albetro/app/data/models/airport_model.dart';
import 'package:albetro/app/data/models/airport_model.dart';

class FlightModel{
  AirportModel? _from;
  AirportModel? _to;
  DateTime? _date;
  int? _adult;
  String? _classs;

  AirportModel? get from => _from;

  AirportModel? get to => _to;

  DateTime? get date => _date;

  int? get adult => _adult;
  String? get classs => _classs;

  FlightModel(this._from, this._to, this._date, this._adult, this._classs);
}