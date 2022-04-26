
import '../../core/utils/responses.dart';
import '../../data/provider/api_service.dart';

class DashboardRepository {
  static ApiProvider _provider = ApiProvider();

  static Future<Responses> getCity(city) async {
    final response = await _provider.getCity(city);
    return  response;
  }





}

