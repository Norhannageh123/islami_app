import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Model/Sura_model.dart';
import 'package:islami_app/Widgets/appcolors.dart';
import 'package:islami_app/tabs/quran/sura_content.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});
  static const String routeName = '/sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(args.FileName);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          args.suraEngName,
          style: TextStyle(
            color: AppColor.PrimaryDark,
            fontSize: screenWidth * 0.05,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColor.blackColor,
            child: Image.asset(
              'assets/images/details_screen_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(height: screenHeight * 0.03),
              Text(
                args.SuraArName,
                style: TextStyle(
                  color: AppColor.PrimaryDark,
                  fontSize: screenWidth * 0.06,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Expanded(
                child: verses.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.PrimaryDark,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return SuraContent(
                            content: verses[index],
                            index: index,
                          );
                        },
                        itemCount: verses.length,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent = await rootBundle.loadString('assets/Suras/$fileName');
    List<String> suraLines = suraContent.split('\n');
    setState(() {
      verses = suraLines;
    });
  }
}
