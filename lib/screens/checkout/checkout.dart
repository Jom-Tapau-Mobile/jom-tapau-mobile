import 'package:flutter/material.dart';

const DELIVERY_CHARGE = 1.00;

class CheckoutPage extends StatefulWidget {
  final double totalPrice;

  CheckoutPage({required this.totalPrice});

  @override
  State<CheckoutPage> createState() => _CheckoutPage();
}

class _CheckoutPage extends State<CheckoutPage> {
  String deliveryDate;
  String deliveryTime;
  String address;
  String roomNumber;

  List<String> deliveryDates = [
    "Today",
    "Next Day",
    "Day After Tomorrow",
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
}
