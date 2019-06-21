import 'package:http/http.dart' as http;

class Api {

  factory Api() => _instance;
  static final Api _instance = new Api._internal();
  Api._internal();

  final _url = "https://virtserver.swaggerhub.com/Blockbyte/issueSoil/1.0.0";

  Future<http.Response> getSoil() async {
    return await _getResponse("soil");
  }

  Future<http.Response> _getResponse(String resource) async {
    return await http.get("$_url/$resource");
  }
}