import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpServiceVenta {
  final String baseUrl = dotenv.env['API_SERVER']!;

  HttpServiceVenta();

  ingresar(json) async {
    String apiUrl = '$baseUrl/venta';
    var request = http.Request(
      'POST',
      Uri.parse(apiUrl),
    );
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(json);
    return request.send();
  }
}
