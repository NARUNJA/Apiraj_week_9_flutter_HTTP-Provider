import 'package:flutter/material.dart';
import 'package:test112/jsonapiCrypto/model/json_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JsonDataBinance with ChangeNotifier {
  final String apiURL = "https://api2.binance.com/api/v3/ticker/24hr";

  Future<List<JsonMBinance>> fetchJSONBinance() async {
    var jsonResponse = await http.get(Uri.parse(apiURL));

    if (jsonResponse.statusCode == 200) {
      final jsonItems =
          json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
      List<JsonMBinance> templist = jsonItems.map<JsonMBinance>((json) {
        return JsonMBinance.fromJson(json);
      }).toList();
      //notifyListeners();
      return templist;
    } else {
      throw Exception('Faild to load data!!');
    }
  }
}
