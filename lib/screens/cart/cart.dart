import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/models/product.dart';
import '../checkout/checkout.dart';

class ShoppingCartPage extends StatefulWidget {
  final List<dynamic> cartItems;

  ShoppingCartPage({required this.cartItems});

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  void _incrementQuantity(product) {
    setState(() {
      product.quantity++;
    });
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var item in widget.cartItems) {
      int quantity = int.parse(item['quantity'].toString());
      num price = num.parse(item['price']);

      totalPrice += quantity * price;
      print(totalPrice);
    }

    return totalPrice;
  }

  void _decrementQuantity(product) {
    setState(() {
      if (product.quantity > 1) {
        product.quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Jom Tapau - Food Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length + 1,
        itemBuilder: (context, index) {
          if (index < widget.cartItems.length) {
            final item = widget.cartItems[index];
            return ListTile(
              title: Text("${item['name']}"),
              subtitle: Text('${item['price']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        item['quantity']++;
                      });
                      print(item['quantity']);
                    },
                  ),
                  Text('${item['quantity']}'),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (item['quantity'] > 1) item['quantity']--;
                      });
                      print(item['quantity']);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        widget.cartItems.remove(item);
                      });
                    },
                  ),
                ],
              ),
              /////
            );
          } else {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.red, // Set the desired background color here
              ),
              onPressed: () {
                setState(() {});

                // Handle button press
              },
              child: Text('Total Price: ${calculateTotalPrice()}'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              8.0), // Set the desired border radius for the rectangle
        ),
        child: Text(
          "Checkout",
          style: TextStyle(fontSize: 10.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutPage(
                totalPrice: calculateTotalPrice(),
              ),
            ),
          );
        },
      ),
    );
  }
}
