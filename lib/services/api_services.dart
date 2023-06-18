import 'dart:async';
import 'dart:convert';

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

//get all orders admin
Future<List<dynamic>> getAllOrders() async {
  Uri url = Uri.parse("https://jom-tapau-backend.onrender.com/allOrders");

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

//get a specific user order
Future<List<dynamic>> getUserOrder(var userEmail) async {
  Uri url = Uri.parse("https://jom-tapau-backend.onrender.com/findUserOrder");
  var email = jsonEncode({"email": userEmail});
  var headers = {'content-type': 'application/json'};
  var post = await http.post(url, body: email, headers: headers);
  if (post.statusCode == 200) {
    var data = jsonDecode(post.body);
    // print(data);
    return data;
  } else {
    print(post.statusCode);
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

// function to fetch data
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

//function to delete data
Future<String> deleteFood(var id) async {
  Uri url =
      Uri.parse("https://jom-tapau-backend.onrender.com/foodDelete/${id}");
  var error = '';
  var response = await http.get(url);
  if (response.statusCode == 200) {
    error = "Data Inserted!";
    print(json);
  } else {
    error = "Failed!";
    print("error");
  }
  return error;
}

//get single food

Future<List<dynamic>> getSingleFood(var id) async {
  Uri url = Uri.parse("https://jom-tapau-backend.onrender.com/food/${id}");

  var response = await http.get(url);
  var data;
  if (response.statusCode == 200) {
    var jsonString = response.body;
    data = json.decode(jsonString);
    print(data);
  } else {
    throw Exception('Failed to fetch data from API');
  }
  return data;
}

Future<String> updateFood(var foodObj, var id) async {
  Uri url = Uri.parse("https://jom-tapau-backend.onrender.com/food/${id}");
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
  var post = await http.put(url, body: jsonData, headers: headers);
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

Future<String> postOrder(var orderObj) async {
  // print(orderObj);
  Uri url = Uri.parse('https://jom-tapau-backend.onrender.com/postOrder');
  var headers = {'Content-Type': 'application/json'};
  var jsonData = jsonEncode(orderObj);
  print(jsonData);

  try {
    var response = await http.post(url, body: jsonData, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse);
    } else {
      print(response.statusCode);
    }
  } catch (error) {
    print('Error: $error');
  }
  return "";
}
