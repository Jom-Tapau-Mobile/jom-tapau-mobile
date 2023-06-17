import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Slider extends StatefulWidget {
  const Slider({super.key});

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/food1.jpg'},
    {"id": 2, "image_path": 'assets/images/food2.jpg'},
    {"id": 3, "image_path": 'assets/images/food3.jpg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
