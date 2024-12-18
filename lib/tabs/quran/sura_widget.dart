import 'package:flutter/material.dart';
import 'package:islami_app/Model/Sura_model.dart';
import 'package:islami_app/utls/app_style.dart';


class SuraWidget extends StatelessWidget {
  SuraWidget({
    super.key,
    required this.suramodel,
    required this.index,
  });

  final SuraModel suramodel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.01,
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/vector_image.png',
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
              ),
              Text(
                "${index + 1}",
                style: AppStyle.white20bold,
                ),
            ],
          ),
          SizedBox(
            width: screenWidth * 0.05,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suramodel.suraEngName,
                      style: AppStyle.white20bold,
                    ),
                    Text(
                      "${suramodel.ayaNumber} Verses",
                      style:AppStyle.white14bold
                    ),
                  ],
                ),
                Text(
                  suramodel.SuraArName,
                  style: AppStyle.white20bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
