import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Model/hadith_model.dart';
import 'package:islami_app/Widgets/appcolors.dart';
import 'package:islami_app/tabs/hadeth/hadith_details_screen.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadithModel> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadithFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/Logo.png'),
        CarouselSlider.builder(
          itemCount: hadithList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                HadithDetailsScreen.routeName,
                arguments: hadithList[itemIndex],
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.PrimaryDark,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/hadith_bg_image.png"),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      hadithList[itemIndex].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: Text(
                        hadithList[itemIndex].content.join(''),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          options: CarouselOptions(
            height: 500,
            viewportFraction: 0.75,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
        ),
      ],
    );
  }

  void loadHadithFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString('assets/Hadeeth/h$i.txt');
      List<String> hadithLines = hadithContent.split("\n");
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      HadithModel hadithModel = HadithModel(title: title, content: hadithLines);
      hadithList.add(hadithModel);
      setState(() {});
    }
  }
}
