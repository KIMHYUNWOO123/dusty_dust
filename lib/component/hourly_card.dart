import 'package:flutter/material.dart';

import 'card_title.dart';
import 'main_card.dart';

class HourlyCard extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;

  const HourlyCard(
      {required this.darkColor, required this.lightColor, super.key});

  @override
  Widget build(BuildContext context) {
    return MainCard(
      backgroundColor: lightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            backgroundColor: darkColor,
            title: '시간별 미세먼지',
          ),
          Column(
            children: List.generate(
              24,
              (index) {
                final now = DateTime.now();
                final hour = now.hour;
                int currentHour = hour - index;
                if (currentHour < 0) {
                  currentHour += 24;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '$currentHour시',
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'asset/img/good.png',
                          height: 20.0,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        '좋음',
                        textAlign: TextAlign.right,
                      )),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
