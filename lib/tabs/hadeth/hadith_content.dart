import 'package:flutter/material.dart';
import 'package:islami_app/utls/app_style.dart';

class HadithContent extends StatefulWidget {
  const HadithContent({super.key, required this.content});
  final String content;

  @override
  _HadithContentState createState() => _HadithContentState();
}

class _HadithContentState extends State<HadithContent> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(
          widget.content,
          textAlign: TextAlign.center,
          style: AppStyle.primary20bold.copyWith(
            color:const  Color.fromARGB(255, 148, 137, 118),
          ),
        ),
      ),
    );
  }
}
