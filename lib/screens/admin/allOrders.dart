import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/api_services.dart';

class allOrder extends StatefulWidget {
  const allOrder({super.key});

  @override
  State<allOrder> createState() => _allOrderState();
}

class _allOrderState extends State<allOrder> {
  var data = getAllOrders();
  @override
  Widget build(BuildContext context) {
    data.then((value) => print(value));
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getAllOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            // Process and display the orders here
            List<dynamic> orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                // Build your UI for each order item here
                return ListTile(
                  title: Text('Order ${index + 1}'),
                  subtitle: Text('Status: ${orders[index]['status']}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error occurred: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: Text('No orders available'),
            );
          }
        },
      ),
    );
  }
}
