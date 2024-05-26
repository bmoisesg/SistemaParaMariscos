import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpServiceProduct {
  final String baseUrl = dotenv.env['API_SERVER']!;

  HttpServiceProduct();

  traer() async {
    String apiUrl = '$baseUrl/producto';
    var request = http.Request(
      'GET',
      Uri.parse(apiUrl),
    );
    return request.send();
  }

  ingresar(json) async {
    String apiUrl = '$baseUrl/producto';
    var request = http.Request(
      'POST',
      Uri.parse(apiUrl),
    );
    request.bodyFields = json;
    return request.send();
  }
}
