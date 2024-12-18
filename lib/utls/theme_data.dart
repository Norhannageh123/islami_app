import 'package:flutter/material.dart';
import 'package:islami_app/utls/appcolors.dart';


class MyThemeData{
   static final ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.PrimaryDark,
      selectedItemColor: AppColor.whiteColor,
      unselectedItemColor: AppColor.blackColor,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
     backgroundColor: AppColor.blackColor,
     centerTitle: true,
     iconTheme: IconThemeData(
      color: AppColor.PrimaryDark,
     )
    )
   );
}