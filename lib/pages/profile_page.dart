import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetResponsiveView {
  ProfilePage({super.key});
  static const routeName ="/profile";

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile',style: TextStyle(fontSize: 32),),
    );;
  }
}
