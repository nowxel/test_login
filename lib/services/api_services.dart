import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_login/login/models/result_model.dart';

import '../constants.dart';

abstract class APIService{
  Future<ResultModel> getResults();
}

class APIWeb implements APIService{

  @override
  Future<ResultModel> getResults() async {
    var response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode == 200){
      final parsed = json.decode(response.body);
      final dataJson = ResultModel.fromJSON(parsed);
      return dataJson;
    } else{
      throw Exception(response.statusCode);
    }
  }

}