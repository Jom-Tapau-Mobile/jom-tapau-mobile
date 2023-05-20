import 'dart:convert';
import 'dart:js';

import 'package:http/http.dart' as http;
import 'package:jom_tapau_mobile/models/foodObj.dart';
import 'package:jom_tapau_mobile/snackbar.dart';

Future<String> postData(var foodObj) async {
  Uri url = Uri.parse("https://jom-tapau-backend.onrender.com/food");
  var error = '';
  var data = {
    "name": "name",
    "price": "price",
    "imgURL": "imgURL",
    "category": "category",
    "description": "description"
  };
  var jsonData = jsonEncode(foodObj);
  var headers = {'content-type': 'application/json'};
  var post = await http.post(url, body: jsonData, headers: headers);
  if (post.statusCode == 200) {
    error = "Data Inserted!";
    var json = jsonDecode(post.body);
    print(json);
  } else {
    error = "Failed!";
    print("error");
  }
  return error;
}

Future<List<dynamic>> getData() async {
  Uri url = Uri.parse("https://jom-tapau-backend.onrender.com/food");

  var response = await http.get(url);
  var data;
  if (response.statusCode == 200) {
    var jsonString = response.body;
    data = json.decode(jsonString);
    // print(data);
  } else {
    throw Exception('Failed to fetch data from API');
  }
  return data;
}
