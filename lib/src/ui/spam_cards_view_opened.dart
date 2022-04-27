/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class SpamCardsViewOpened extends StatelessWidget {
  final double? percent;
  

  const SpamCardsViewOpened(this.percent, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("You've opened",
          style: TextStyle(
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style',
              fontWeight: FontWeight.w600,
              fontSize: SizeProvider.instance.text(10),
              color: const Color(0xFF00133F))),
      Container(
          margin: EdgeInsets.symmetric(vertical: SizeProvider.instance.size(8)),
          height: SizeProvider.instance.size(6),
          width: SizeProvider.instance.size(6),
          child: Stack(children: [
            Center(
                child: RichText(
                    text: TextSpan(
                        text: (percent! * 100).round().toString(),
                        //TODO FIX!
                        style: TextStyle(
                            color: _getProgressColor(percent! * 100),
                            fontFamily: TextProvider.familyKoara, package: 'tiki_style',
                            fontSize: SizeProvider.instance.text(19),
                            fontWeight: FontWeight.bold),
                        children: [
                  TextSpan(
                    text: " ",
                    style: TextStyle(fontSize: SizeProvider.instance.text(6)),
                  ),
                  TextSpan(
                    text: "%",
                    style: TextStyle(
                        fontFamily: TextProvider.familyNunitoSans, package: 'tiki_style',
                        fontSize: SizeProvider.instance.text(11.5),
                        fontWeight: FontWeight.w800),
                  )
                ]))),
            SizedBox(
              height: SizeProvider.instance.size(6),
              width: SizeProvider.instance.size(6),
              child: CircularProgressIndicator(
                  strokeWidth: SizeProvider.instance.size(1),
                  backgroundColor: const Color(0xFFC4C4C4),
                  value: percent,
                  color: _getProgressColor(percent! * 100)),
            )
          ])),
      Text("of their emails",
          style: TextStyle(
              fontFamily: TextProvider.familyNunitoSans, package: 'tiki_style',
              fontWeight: FontWeight.w600,
              fontSize: SizeProvider.instance.text(10),
              color: const Color(0xFF00133F)))
    ]);
  }

  _getProgressColor(percent) {
    if (percent <= 50) {
      return const Color(0xFFE89933);
    } else {
      return const Color(0xFF00B272);
    }
  }
}
