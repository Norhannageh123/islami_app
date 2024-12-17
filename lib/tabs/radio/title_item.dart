import 'package:flutter/material.dart';
import 'package:islami_app/Widgets/appcolors.dart';

class TitleItem extends StatefulWidget {
const  TitleItem({super.key,required this.title});
  final String title;

  @override
  State<TitleItem> createState() => _TitleItemState();
}

class _TitleItemState extends State<TitleItem> {
  bool isPressed = false; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
           onTap: () {
        setState(() {
          isPressed = !isPressed; 
        });
      },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
             color: isPressed ? AppColor.PrimaryDark : const Color.fromARGB(150, 26, 25, 25),
          ),
          height: 50,
          width: 150,
          alignment: Alignment.center,
          child:  Text(
            widget.title,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 20,
               color: isPressed ? AppColor.blackColor : AppColor.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
