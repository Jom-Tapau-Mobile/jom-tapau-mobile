import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const DELIVERY_CHARGE = 1.00;

class CheckoutPage extends StatefulWidget {
  final double totalPrice;

  CheckoutPage({required this.totalPrice});

  @override
  State<CheckoutPage> createState() => _CheckoutPage();
}

class _CheckoutPage extends State<CheckoutPage> {
  String deliveryDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
  String deliveryTime = "ASAP";
  String address = "KLG Block A";
  String roomNumber = '';
  String paymentOption = 'Cash on Delivery';

  List<String> deliveryDates = [
    DateFormat('MMMM dd, yyyy').format(DateTime.now()),
    DateFormat('MMMM dd, yyyy').format(DateTime.now().add(Duration(days: 1))),
    DateFormat('MMMM dd, yyyy').format(DateTime.now().add(Duration(days: 1))),
  ];

  List<String> deliveryTimes = [
    "ASAP",
    "After 30 mins",
    "After 1 hour",
  ];

  List<String> addressOptions = [
    "KLG Block A",
    "KLG Block B",
    "KLG Block C",
    "KLG Block D",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Jom Tapau - Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section: Delivery Details
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Delivery Date:'),
                            DropdownButton(
                              value: deliveryDate,
                              onChanged: (value) {
                                setState(() {
                                  deliveryDate = value.toString();
                                });
                              },
                              items: deliveryDates.map((date) {
                                return DropdownMenuItem(
                                  value: date,
                                  child: Text(date),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Delivery Time:'),
                            DropdownButton(
                              value: deliveryTime,
                              onChanged: (value) {
                                setState(() {
                                  deliveryTime = value.toString();
                                });
                              },
                              items: deliveryTimes.map((time) {
                                return DropdownMenuItem(
                                  value: time,
                                  child: Text(time),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  // Subsection: Address
                  Text('Address:', style: TextStyle(color: Colors.black)),
                  DropdownButton(
                    value: address,
                    onChanged: (value) {
                      setState(() {
                        address = value.toString();
                      });
                    },
                    items: addressOptions.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(
                          option,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  // Room Number input field
                  Text('Room Number:', style: TextStyle(color: Colors.black)),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Room Number',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        roomNumber = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),

            // Section: Personal Details
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Name input field (disabled)
                  Text('Name:'),
                  TextFormField(
                    initialValue: 'ABC',
                    enabled: false,
                  ),
                  SizedBox(height: 16.0),
                  // Email input field (disabled)
                  Text('Email:'),
                  TextFormField(
                    initialValue: 'abc@abc.cd',
                    enabled: false,
                  ),
                  SizedBox(height: 16.0),
                  // Phone Number input field (disabled)
                  Text('Phone Number:'),
                  TextFormField(
                    initialValue: '1234',
                    enabled: false,
                  ),
                ],
              ),
            ),

            // Section: Payment
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Payment options
                  ListTile(
                    title: Text('Cash on Delivery'),
                    leading: Radio(
                      value: 'Cash on Delivery',
                      groupValue: paymentOption,
                      onChanged: (value) {
                        setState(() {
                          paymentOption = value.toString();
                        });
                      },
                    ),
                  ),
                  // ListTile(
                  //   title: Text('Card'),
                  //   leading: Radio(
                  //     value: 'Card',
                  //     groupValue: paymentOption,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         paymentOption = value.toString();
                  //       });
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
