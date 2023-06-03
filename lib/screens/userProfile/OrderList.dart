import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderList extends StatefulWidget {
  final String? userEmail;

  const OrderList({Key? key, this.userEmail}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<dynamic> orderHistory = [];

  @override
  void initState() {
    super.initState();
    fetchOrderHistory();
  }

  Future<void> fetchOrderHistory() async {
    try {
      final response = await http.post(
        Uri.parse('https://jom-tapau-backend.onrender.com/findUserOrder'),
        body: {'email': widget.userEmail},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          orderHistory = data;
        });
      } else {
        print('Failed to fetch order history. Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to fetch order history. Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Center(
        child: orderHistory.isEmpty
            ? Text(
                'No order history available.',
                style: TextStyle(fontSize: 16),
              )
            : ListView.builder(
                itemCount: orderHistory.length,
                itemBuilder: (context, index) {
                  final order = orderHistory[index];
                  return ListTile(
                    title: Text('Order: ${order['order']}'),
                    subtitle: Text('Status: ${order['status']}'),
                  );
                },
              ),
      ),
    );
  }
}
