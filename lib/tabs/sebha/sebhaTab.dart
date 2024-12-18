import 'package:flutter/material.dart';
import 'package:islami_app/utls/app_style.dart';
import 'package:islami_app/utls/appcolors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _counter = 0;
  double turns = 0.0;
  int index = 0;
 List<String> azkar = [
  'سبحان الله',
  'الله اكبر',
  'الحمد لله',
  'لا إله إلا الله',
  'لا حول ولا قوة إلا بالله',
  'اللهم صل وسلم\n على نبينا محمد',
  'أستغفر الله العظيم',
  'سبحان الله وبحمده\n سبحان الله العظيم',
  'رب اغفر لي وتب علي \nإنك أنت التواب الرحيم',
  'اللهم اجعلني من التوابين \nواجعلني من المتطهرين',
];


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sebha_bg.png'),
              fit: BoxFit.cover)),
      child: InkWell(
        autofocus: false,
        hoverColor: AppColor.whiteColor,
        focusColor: AppColor.whiteColor,
        highlightColor: AppColor.whiteColor,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() => turns += 1 / 33);
          _counter++;
          if (_counter == 33) {
            _counter = 0;
            index++;
          }

          if (_counter == 33) {
            _counter = 0;
            index++;
          }

          if (index == azkar.length) {
            index = 0;
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Logo.png'),
                const SizedBox(height: 20),
                Text(
                  'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                  style: AppStyle.white36bold,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            azkar[index],
                            style: AppStyle.white30bold,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '$_counter',
                            style: AppStyle.white30bold,
                          ),
                        ],
                      ),
                      AnimatedRotation(
                        turns: turns,
                        duration: const Duration(milliseconds: 50),
                        child: Image.asset(
                          'assets/images/Sebha.png',
                          fit: BoxFit.fitWidth,
                          centerSlice: Rect.zero,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
