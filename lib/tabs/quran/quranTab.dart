import 'package:flutter/material.dart';
import 'package:islami_app/Model/Sura_model.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/tabs/quran/sura_widget.dart';
import 'package:islami_app/utls/app_style.dart';
import 'package:islami_app/utls/appcolors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.SuraList.add(SuraModel(
          suraEngName: SuraModel.engSura[i],
          SuraArName: SuraModel.arSura[i],
          ayaNumber: SuraModel.ayaNum[i],
          FileName: '${i + 1}.txt'));
    }
  }

  @override
  void initState() {
    super.initState();
    addSuraList();
    loadLastSura();
    setState(() {});
  }

  Map<String, String> loudSuraList = {};
  List<SuraModel> filterList = SuraModel.SuraList;
  String SearchText = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
  

    return Container(
      margin: EdgeInsets.all(screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/Logo.png',
            width: screenWidth * 0.5, // Adjust logo size responsively
          ),
          TextField(
            cursorColor: AppColor.whiteColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColor.PrimaryDark,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColor.PrimaryDark,
                  width: 2,
                ),
              ),
              prefixIcon: const ImageIcon(
                color: AppColor.PrimaryDark,
                AssetImage('assets/images/search_icon.png'),
              ),
              hintText: "Sura Name",
              hintStyle: AppStyle.white16bold,
            ),
            onChanged: (text) {
              SearchText = text;
              filterList = SuraModel.SuraList.where((suraModel) {
                return suraModel.SuraArName.contains(SearchText) ||
                    suraModel.suraEngName
                        .toLowerCase()
                        .contains(SearchText.toLowerCase());
              }).toList();
              setState(() {});
            },
            style: const TextStyle(color: AppColor.whiteColor),
          ),
          const SizedBox(height: 20),
          SearchText.isNotEmpty ? SizedBox() : BuildMostResently(),
          const SizedBox(height: 10),
          Text(
            "Sura List",
            style: AppStyle.white16bold,
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  savedLastSura(
                    SuraEnName: filterList[index].suraEngName,
                    SuraArName: filterList[index].SuraArName,
                    NumOfVerses: filterList[index].ayaNumber.toString(),
                  );
                  Navigator.of(context).pushNamed(
                    SuraDetailsScreen.routeName,
                    arguments: filterList[index],
                  );
                },
                child: SuraWidget(
                  suramodel: filterList[index],
                  index: index,
                ),
              );
            },
            padding: EdgeInsets.zero,
            itemCount: filterList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: AppColor.whiteColor,
                thickness: 2,
                indent: 30.50,
                endIndent: 25.50,
              );
            },
          )),
        ],
      ),
    );
  }

  Widget BuildMostResently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Resently",
          style: AppStyle.white16bold,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.PrimaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        loudSuraList['SuraEnName'] ?? '',
                        style: AppStyle.black24bold,
                      ),
                      Text(
                        loudSuraList['SuraArName'] ?? '',
                        style: AppStyle.black24bold,
                      ),
                      Text(
                        loudSuraList['NumOfVerses'] != null
                            ? '${loudSuraList['NumOfVerses']} verses'
                            : '',
                        style: AppStyle.black14bold,
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/recently_image.png",
                    width: 80, // Adjust the image size responsively
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  savedLastSura(
      {required String SuraEnName,
      required String SuraArName,
      required String NumOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("SuraEnName", SuraEnName);
    await prefs.setString("SuraArName", SuraArName);
    await prefs.setString("NumOfVerses", NumOfVerses);
    await loadLastSura();
  }

  getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String SuraEnName = prefs.getString("SuraEnName") ?? "";
    String SuraArName = prefs.getString("SuraArName") ?? "";
    String NumOfVerses = prefs.getString("NumOfVerses") ?? "";
    return {
      "SuraEnName": SuraEnName,
      "SuraArName": SuraArName,
      "NumOfVerses": NumOfVerses,
    };
  }

  loadLastSura() async {
    loudSuraList = await getLastSura();
    setState(() {});
  }
}
