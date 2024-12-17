import 'package:flutter/material.dart';
import 'package:islami_app/Widgets/appcolors.dart';

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
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
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
          body: Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Logo.png'),
                  const SizedBox(height: 20),
                  const Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: AppColor.whiteColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                              style: const TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '$_counter',
                              style: const TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
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
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
