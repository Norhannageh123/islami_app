import 'package:flutter/material.dart';
import 'package:islami_app/tabs/radio/cardItem.dart';
import 'package:islami_app/tabs/radio/title_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Logo.png'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TitleItem(title: "Radio"),
              TitleItem(title: "Reciters"),
            ],
          ),
          const SizedBox(height: 5),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Carditem(
                    text: "Radio Ibrahim Al-Akdar",
                    icon1: Icons.favorite,
                    size1: 40,
                    icon2: Icons.play_arrow,
                    size2: 50,
                    icon3: Icons.volume_up,
                    size3: 40,
                  ),
                  SizedBox(height: 5),
                  Carditem(
                    text: "Radio Al-Qaria Yassen",
                    icon1: Icons.favorite,
                    size1: 40,
                    icon2: Icons.pause,
                    size2: 50,
                    icon3: Icons.volume_off,
                    size3: 40,
                  ),
                  SizedBox(height: 5),
                  Carditem(
                    text: "Radio Ahmed Al-trabulsi",
                    icon1: Icons.favorite_border_outlined,
                    size1: 40,
                    icon2: Icons.pause,
                    size2: 50,
                    icon3: Icons.volume_off,
                    size3: 40,
                  ),
                  SizedBox(height: 5),
                  Carditem(
                    text: "Radio Ahmed Al-trabulsi",
                    icon1: Icons.favorite_border_outlined,
                    size1: 40,
                    icon2: Icons.pause,
                    size2: 50,
                    icon3: Icons.volume_off,
                    size3: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
