import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  
  NetworkHelper({@required this.site, this.lattitude, this.longitude});
  final String site;
  final double lattitude;
  final double longitude;

  Future getData() async {
   var client = http.Client();
   var url = Uri.parse(site);
   var response = await client.get(url);
   if (response.statusCode == 200) {
     return jsonDecode(response.body);
   }
   else {
     print(response.statusCode);
   }
   return null;
  }
}