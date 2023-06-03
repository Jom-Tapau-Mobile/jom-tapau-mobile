import 'package:flutter/material.dart';

const DELIVERY_CHARGE = 1.00;

class CheckoutPage extends StatefulWidget {
  final double totalPrice;

  CheckoutPage({required this.totalPrice});
  
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}
