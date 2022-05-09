/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class CardViewWidgetOpened extends StatelessWidget {
  final double? percent;

  const CardViewWidgetOpened(this.percent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("You've opened",
          style: TextStyle(
              fontFamily: TextProvider.familyNunitoSans,
              package: TextProvider.package,
              fontWeight: FontWeight.w600,
              fontSize: SizeProvider.instance.text(12),
              color: ColorProvider.tikiBlue)),
      Container(
          margin:
              EdgeInsets.symmetric(vertical: SizeProvider.instance.height(12)),
          height: SizeProvider.instance.width(72.5),
          width: SizeProvider.instance.width(72.5),
          child: Stack(children: [
            Center(
                child: RichText(
                    text: TextSpan(
                        text: (percent! * 100).round().toString(),
                        //TODO FIX!
                        style: TextStyle(
                            color: _getProgressColor(percent! * 100),
                            fontFamily: TextProvider.familyKoara,
                            package: TextProvider.package,
                            fontSize: SizeProvider.instance.text(32),
                            fontWeight: FontWeight.bold),
                        children: [
                  TextSpan(
                    text: " ",
                    style: TextStyle(fontSize: SizeProvider.instance.text(6)),
                  ),
                  TextSpan(
                    text: "%",
                    style: TextStyle(
                        fontFamily: TextProvider.familyNunitoSans,
                        package: TextProvider.package,
                        fontSize: SizeProvider.instance.text(14),
                        fontWeight: FontWeight.w800),
                  )
                ]))),
            SizedBox(
              height: SizeProvider.instance.width(72.5),
              width: SizeProvider.instance.width(72.5),
              child: CircularProgressIndicator(
                  strokeWidth: SizeProvider.instance.width(8),
                  backgroundColor: const Color(0xFFC4C4C4),
                  value: percent,
                  color: _getProgressColor(percent! * 100)),
            )
          ])),
      Text("of their emails",
          style: TextStyle(
              fontFamily: TextProvider.familyNunitoSans,
              package: TextProvider.package,
              fontWeight: FontWeight.w600,
              fontSize: SizeProvider.instance.text(12),
              color: ColorProvider.tikiBlue))
    ]);
  }

  _getProgressColor(percent) {
    if (percent <= 50) {
      return ColorProvider.tikiOrange;
    } else {
      return ColorProvider.green;
    }
  }
}
