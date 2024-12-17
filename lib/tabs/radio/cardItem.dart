import 'package:flutter/material.dart';
import 'package:islami_app/Widgets/appcolors.dart';
import 'package:islami_app/tabs/radio/icon_item.dart';

class Carditem extends StatelessWidget {
  const Carditem({super.key,required this.text,required this.icon1, required this.size1,required this.icon2, required this.size2,required this.icon3, required this.size3});
  final String text;
  final IconData icon1;
  final double size1;
   final IconData icon2;
  final double size2;
   final IconData icon3;
  final double size3;
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.PrimaryDark,
              ),
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/images/radio_bk_image.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                         Text(
                          text,
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconItem(icon: icon1,size:size1,),
                            IconItem(icon: icon2, size: size2),
                            IconItem(icon: icon3, size: size3),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}