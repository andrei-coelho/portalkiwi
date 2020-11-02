import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:portalkiwi/resources/Config.dart';

class API {

  static final _API_URL = Config.URL_API;

  static getData(String url, Function callback, {Map<String, dynamic> post}) async {
    Map<String, dynamic> rtr = Map();
    try {
      http.Response response = await http.get(_API_URL + url);
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        rtr['error'] = body['error'];
        rtr['response'] = body['response'];
      } else {
        rtr['error'] = true;
        rtr['response'] = response.statusCode;
      }
    } catch (e){
      rtr['error'] = true;
      rtr['response'] = 999;
    }

    callback(rtr);

  }


}