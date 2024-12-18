import 'package:flutter/material.dart';
import 'package:islami_app/Model/hadith_model.dart';
import 'package:islami_app/tabs/hadeth/hadith_content.dart';
import 'package:islami_app/utls/app_style.dart';
import 'package:islami_app/utls/appcolors.dart';

class HadithDetailsScreen extends StatefulWidget {
  const HadithDetailsScreen({super.key});
  static const String routeName = '/hadith_details';

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadithModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
          style: const TextStyle(color: AppColor.PrimaryDark, fontSize: 20),
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
              const SizedBox(height: 20),
              Text(
                args.title,
                style: AppStyle.primary24bold,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: args.content.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.PrimaryDark,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return HadithContent(content: args.content[index]);
                        },
                        itemCount: args.content.length,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
