// import 'package:flutter/material.dart';
// import 'package:jom_tapau_mobile/models/product.dart';
// import 'package:jom_tapau_mobile/screens/cart/cart.dart';
// import 'package:jom_tapau_mobile/services/api_services.dart';

// class ProductListPage extends StatefulWidget {
//   @override
//   _ProductListPageState createState() => _ProductListPageState();
// }

// getFoodList() async {
//   var data = await getFood();
//   return data;
// }

// class _ProductListPageState extends State<ProductListPage> {
//   List<dynamic> _cartItems = [];

//   // void _addToCart(Product product) {
//   //   setState(() {
//   //     _cartItems.add(product);
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: FutureBuilder(
//           future: getFood(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               var data = snapshot.data;
//               ////////////////////////
//               List<dynamic> foods = data as List<dynamic>;

//               return ListView.builder(
//                 itemCount: foods.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             width: 150.0, // Set the desired width
//                             height: 150.0, // Set the desired height
//                             child: Image.network(
//                               "${foods[index]['imgURL']}",
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Center(
//                                   child: Text(
//                                     "${foods[index]['name']}",
//                                     style: TextStyle(
//                                       fontSize: 16.0,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 8.0),
//                                 Center(
//                                   child: Text(
//                                     "RM ${foods[index]['price']}",
//                                     style: TextStyle(
//                                       fontSize: 14.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 8.0),
//                                 Center(
//                                   child: ElevatedButton(
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all<Color>(
//                                               Colors.red),
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                         _cartItems.add(foods[index]);
//                                       });
//                                       print(_cartItems);
//                                       // cart = cart + 1;
//                                     },
//                                     child: Text('Add to Cart'),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           }),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.shopping_cart),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ShoppingCartPage(cartItems: _cartItems),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
