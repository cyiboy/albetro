
import '../../core/utils/responses.dart';
import '../../data/provider/api_service.dart';

class FlightRepository {
   static final ApiProvider _provider = ApiProvider();

  static Future<Responses> getFlight() async {
    final response = await _provider.getFlight();
    return  response;
  }
   static Future<Responses> getAirline(iata) async {
     final response = await _provider.getAirline(iata);
     return  response;
   }





}

