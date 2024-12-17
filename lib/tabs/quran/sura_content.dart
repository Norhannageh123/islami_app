import 'package:flutter/material.dart';
import 'package:islami_app/Widgets/appcolors.dart';

class SuraContent extends StatefulWidget {
  const SuraContent({super.key, required this.content, required this.index});
  final String content;
  final int index;

  @override
  _SuraContentState createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.02,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenWidth * 0.02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColor.PrimaryDark,
                width: 2,
              ),
              color: isPressed ? AppColor.PrimaryDark : Colors.transparent,
            ),
            child: Text(
              "${widget.content} [${widget.index + 1}]",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: const Color.fromARGB(255, 148, 137, 118),
                fontSize: screenWidth * 0.05,
              ),
            ),
          );
        },
      ),
    );
  }
}
