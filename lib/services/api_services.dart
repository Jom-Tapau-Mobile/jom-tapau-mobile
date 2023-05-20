import 'dart:async';
import 'dart:convert';
import 'dart:js';

import 'package:http/http.dart' as http;
import 'package:jom_tapau_mobile/models/foodObj.dart';
import 'package:jom_tapau_mobile/snackbar.dart';

Future<List<dynamic>> getFood() async {
  Uri url = Uri.parse("https://jom-tapau-backend.onrender.com/food");

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // List<dynamic> foods = [];

      // foods = data.map((food) => FoodObj(
      //     name: food['name'],
      //     price: food['price'],
      //     description: food['quantity'],
      //     category: food['category'],
      //     imgURL: food['imgURL']));
      return data;
    } else {
      return [];
    }
  } catch (e) {
    print(e.toString());
  }
  return [];
}

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
