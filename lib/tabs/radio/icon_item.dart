import 'package:flutter/material.dart';

class IconItem extends StatelessWidget {
  const IconItem({super.key,required this.icon ,required this.size});
  final IconData icon;
  final double size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon:  Icon(icon, size: size),
    );
  }
}
