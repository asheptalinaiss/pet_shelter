import 'package:http/http.dart' as http;
import 'package:pet_shelter/services/basic_network_service.dart';

class NetworkService implements BasicNetworkService {

  static const _baseAddress = "https://petsproject.issart.co/api/1.0.0";

  @override
  Future<void> healthCheck() async {
    try {
      final response = await http.get(Uri.parse("$_baseAddress/tech/healthcheck"));
      if (response.statusCode == 200) {
        print("Health Check success");
      } else {
        throw Exception("Failed health check. Code ${response.statusCode}");
      }
    } catch(error) {
      throw Exception("Failed health check. Error ${error}");
    }
  }
}