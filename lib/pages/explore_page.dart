import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Explore extends GetResponsiveView {
  Explore({super.key});
  static const routeName ="/explore";
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Explore',style: TextStyle(fontSize: 32),),
    );
  }
}
