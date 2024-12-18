import 'package:flutter/material.dart';
import 'package:islami_app/utls/app_style.dart';
import 'package:islami_app/utls/appcolors.dart';

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
     var height=MediaQuery.of(context).size.height;
     var width=MediaQuery.of(context).size.width;
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
          height: height*0.04,
          width: width*0.36,
          alignment: Alignment.center,
          child:  Text(
            widget.title,
            textAlign: TextAlign.center,
            style:  AppStyle.white16bold.copyWith(
               color: isPressed ? AppColor.blackColor : AppColor.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
