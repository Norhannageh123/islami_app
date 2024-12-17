import 'package:flutter/material.dart';
import 'package:islami_app/Model/Sura_model.dart';
import 'package:islami_app/Widgets/appcolors.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/tabs/quran/sura_widget.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

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
              hintStyle:
                  TextStyle(color: AppColor.whiteColor, fontSize: screenWidth * 0.05),
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
          const Text(
            "Sura List",
            style: TextStyle(color: AppColor.whiteColor, fontSize: 20),
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
        const Text(
          "Most Resently",
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColor.PrimaryDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loudSuraList['SuraEnName'] ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    loudSuraList['SuraArName'] ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    loudSuraList['NumOfVerses'] ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
