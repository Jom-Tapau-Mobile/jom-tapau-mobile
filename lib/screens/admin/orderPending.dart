import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderPending extends StatefulWidget {
  const OrderPending({Key? key}) : super(key: key);

  @override
  _OrderPendingState createState() => _OrderPendingState();
}

class _OrderPendingState extends State<OrderPending> {
  List<dynamic> _orderDetails = [];

  @override
  void initState() {
    super.initState();
    fetchOrderDetails();
  }

  Future<void> fetchOrderDetails() async {
    try {
      final response = await http
          .get(Uri.parse('https://jom-tapau-backend.onrender.com/allOrders'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is List) {
          setState(() {
            _orderDetails = data;
          });
          print(_orderDetails);
        }
      } else {
        print('Failed to fetch order details');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> updateOrderStatus(int index, String status) async {
    final orderId = _orderDetails[index]['_id'];
    final url = 'https://jom-tapau-backend.onrender.com/updateRiderOrder';
    final response = await http.put(
      Uri.parse(url),
      body: json.encode({
        'id': orderId,
        'riderEmail': 'your_rider_email',
        'riderName': 'your_rider_name',
        'status': status,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      setState(() {
        _orderDetails[index]['status'] = status;
      });
    } else {
      print('Failed to update order status');
    }
  }

  void acceptOrder(int index) {
    updateOrderStatus(index, 'Accepted');
  }

  void declineOrder(int index) {
    updateOrderStatus(index, 'Declined');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Pending'),
        centerTitle: true,
        backgroundColor: Colors.red, // Set the header color to red
      ),
      body: _orderDetails.isNotEmpty
          ? ListView.builder(
              itemCount: _orderDetails.length,
              itemBuilder: (BuildContext context, int index) {
                final order = _orderDetails[index];
                final orderItem = order['orders']
                    [0]; // Assuming there is only one order item in each order
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Details:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('Customer Name: ${order['name']}'),
                        Text('Delivery Address: ${order['deliveryAddress']}'),
                        Text('Room Number: ${order['roomNumber']}'),
                        Text('Phone Number: ${order['phoneNumber']}'),
                        SizedBox(height: 16),
                        Text('Order Item:'),
                        Text('Name: ${orderItem['name']}'),
                        Text('Price: ${orderItem['price']}'),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (order['status'] != 'Accepted')
                              ElevatedButton(
                                onPressed: () => acceptOrder(index),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .green, // Use backgroundColor instead of primary
                                ),
                                child: Text('Accept'),
                              ),
                            if (order['status'] != 'Accepted')
                              ElevatedButton(
                                onPressed: () => declineOrder(index),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .red, // Use backgroundColor instead of primary
                                ),
                                child: Text('Decline'),
                              ),
                          ],
                        ),
                        if (order['status'] != null)
                          Text(
                            'Order ${order['status']}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text('No order details available'),
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Order Pending',
    home: OrderPending(),
  ));
}
