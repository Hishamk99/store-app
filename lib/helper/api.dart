import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Theres a problem with status code ${response.statusCode}');
    }
  }
  Future<dynamic> post(
      {required String url,
      @required String? body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    Map<String , dynamic> data = jsonDecode(response.body);
    return data;    
  }
}



      // 'Accept': 'application/json',
      // 'Content-type': 'application/x-www-form-urlencoded',
      // 'Authorization': 'Bearer ',



      // 'titlt' : 'test' ,
      // 'price' : '12.5' ,
      // 'description' : 'lorem ijsao set' ,
      // 'image' : 'https://i.pravatar.cc' ,
      // 'ctegory' : 'electronic' ,