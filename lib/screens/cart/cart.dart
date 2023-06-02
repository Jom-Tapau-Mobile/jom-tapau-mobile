import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/models/product.dart';

class ShoppingCartPage extends StatefulWidget {
  final List<dynamic> cartItems;

  ShoppingCartPage({required this.cartItems});

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return ListTile(
            title: Text("${item['name']}"),
            subtitle: Text('${item['price']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.cartItems.remove(item);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
