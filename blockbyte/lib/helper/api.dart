import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:blockbyte/model/land.dart';

class Api {
  factory Api() => _instance;
  static final Api _instance = new Api._internal();
  Api._internal();

  final _urlIssueLand =
      "https://virtserver.swaggerhub.com/Blockbyte/issueSoil/1.0.0";

  Future<List<Land>> getLand() async {
    List jsonList = json.decode(await _get("$_urlIssueLand/soil"));
    List<Land> lands =
        jsonList.map((land) => Land.fromJson(land)).toList();
    return lands;
  }

  Future<void> issueLand(Land land) async {
    await _post("$_urlIssueLand/soil", land.toJson());
  }

  Future<String> _get(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<void> _post(String url, Map body) async {
    final response = await http.post(url, body: json.encode(body));

    if (response.statusCode != 201) {
      throw Exception('Failed to load post');
    }
  }
}
