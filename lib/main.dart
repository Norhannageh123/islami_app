import 'package:flutter/material.dart';
import 'package:islami_app/Screens/home_screen.dart';
import 'package:islami_app/utls/theme_data.dart';
import 'package:islami_app/tabs/hadeth/hadith_details_screen.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';

void main(){
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>  HomeScreen(),
        SuraDetailsScreen.routeName:(context)=>  SuraDetailsScreen(),
         HadithDetailsScreen.routeName:(context)=>  HadithDetailsScreen(),
      },
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}