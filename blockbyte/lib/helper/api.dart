import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:blockbyte/model/land.dart';
import 'package:blockbyte/model/filter.dart';

class Api {
  factory Api() => _instance;
  static final Api _instance = new Api._internal();
  Api._internal();

  final _urlLender = "http://52.209.35.41:8081/api/lender/";
  final _urlLeaser = "http://52.209.35.41:8082/api/leaser/";

  Future<void> issueLand(Land land) async {
    await _post("$_urlLender/soil", land.toJson());
  }

  Future<Map> filterLand(Filter filter) async {
    return json.decode(await _post("$_urlLeaser/soil/filter", filter.toJson()));
  }

  Future<String> _get(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<String> _post(String url, Map body) async {
    final response = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
