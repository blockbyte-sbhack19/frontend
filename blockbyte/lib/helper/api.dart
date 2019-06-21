import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:blockbyte/model/soil.dart';

class Api {
  factory Api() => _instance;
  static final Api _instance = new Api._internal();
  Api._internal();

  final _urlIssueSoil =
      "https://virtserver.swaggerhub.com/Blockbyte/issueSoil/1.0.0";

  Future<List<Soil>> getSoil() async {
    List jsonList = json.decode(await _getResponse("$_urlIssueSoil/soil"));
    List<Soil> soils =
        jsonList.map((soil) => Soil.fromJson(soil)).toList();
    return soils;
  }

  Future<String> _getResponse(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return response.body;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
