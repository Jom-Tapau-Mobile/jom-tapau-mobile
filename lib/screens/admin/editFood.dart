import 'package:flutter/material.dart';

import '../../services/api_services.dart';

class EditFood extends StatefulWidget {
  const EditFood({super.key});

  @override
  State<EditFood> createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  Future<List> foodItems = getData();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
