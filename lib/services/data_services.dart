// ignore_for_file: unused_import, unused_local_variable, avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/data_model.dart';

class DataServices {
  String baseurl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getinfo() async {
    var apiurl = "/getplaces";
    http.Response res = await http.get(Uri.parse(baseurl + apiurl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
