import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/models/product.dart';

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
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return Column(
            children: [
              ListTile(
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
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Set the desired color here
                  ),
                  onPressed: () {
                    //order placement functions
                  },
                  child: Text(
                    "Proceed to Checkout",
                  ))
            ],
          );
        },
      ),
    );
  }
}
