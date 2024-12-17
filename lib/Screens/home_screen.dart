import 'package:flutter/material.dart';
import 'package:islami_app/Widgets/appcolors.dart';
import 'package:islami_app/tabs/hadeth/hadethTab.dart';
import 'package:islami_app/tabs/quran/quranTab.dart';
import 'package:islami_app/tabs/radio/radioTab.dart';
import 'package:islami_app/tabs/sebha/sebhaTab.dart';
import 'package:islami_app/tabs/time/TimeTab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> bgImages = [
    'assets/images/Background.png',
    'assets/images/hadth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget>tabs=[
     QuranTab(),
    const  HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          bgImages[selectedIndex],
          key: ValueKey(bgImages[selectedIndex]), 
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColor.PrimaryDark,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: buildItemBottomNavBar(
                      index: 0, imageName: "quran_icon"),
                  label: "Quran",
                ),
                BottomNavigationBarItem(
                  icon: buildItemBottomNavBar(
                      index: 1, imageName: "hadeth_icon"),
                  label: "Hadith",
                ),
                BottomNavigationBarItem(
                  icon: buildItemBottomNavBar(
                      index: 2, imageName: "sebha_icon"),
                  label: "Sebha",
                ),
                BottomNavigationBarItem(
                  icon: buildItemBottomNavBar(
                      index: 3, imageName: "radio_icon"),
                  label: "Radio",
                ),
                BottomNavigationBarItem(
                  icon: buildItemBottomNavBar(
                      index: 4, imageName: "time_icon"),
                  label: "Time",
                ),
              ],
            ),
          ),
          body:tabs[selectedIndex],
        ),
      ],
    );
  }

  Widget buildItemBottomNavBar({
    required int index,
    required String imageName,
  }) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColor.blackbgColor,
            ),
            child: ImageIcon(
              AssetImage('assets/images/$imageName.png'),
            ),
          )
        : ImageIcon(
            AssetImage('assets/images/$imageName.png'),
          );
  }
}
