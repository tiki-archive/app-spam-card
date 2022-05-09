/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class CardViewWidgetFreq extends StatelessWidget {
  final String frequency;
  final String category;

  const CardViewWidgetFreq(this.frequency, this.category, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("They send you emails",
            style: TextStyle(
                fontFamily: TextProvider.familyNunitoSans,
                package: TextProvider.package,
                fontSize: SizeProvider.instance.text(12),
                fontWeight: FontWeight.w600,
                color: ColorProvider.tikiBlue)),
        Padding(padding: EdgeInsets.only(top: SizeProvider.instance.height(6))),
        Text('${frequency[0].toUpperCase()}${frequency.substring(1)}',
            style: TextStyle(
                fontFamily: TextProvider.familyKoara,
                package: TextProvider.package,
                fontSize: SizeProvider.instance.text(32),
                fontWeight: FontWeight.w800,
                color: _getTextColor(frequency))),
        Padding(padding: EdgeInsets.only(top: SizeProvider.instance.height(6))),
        _getCategory(category)
      ],
    );
  }

  _getTextColor(String frequency) {
    switch (frequency) {
      case "monthly":
        return ColorProvider.green;
      case "daily":
        return ColorProvider.tikiRed;
      case "weekly":
        return ColorProvider.tikiOrange;
    }
  }

  _getCategory(category) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('in',
              style: TextStyle(
                  fontFamily: TextProvider.familyNunitoSans,
                  package: TextProvider.package,
                  fontSize: SizeProvider.instance.text(12),
                  fontWeight: FontWeight.w600,
                  color: ColorProvider.tikiBlue)),
          Padding(
            padding: EdgeInsets.only(left: SizeProvider.instance.width(5)),
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorProvider.greySeven,
                      width: SizeProvider.instance.width(1)),
                  borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.symmetric(
                  vertical: SizeProvider.instance.height(3),
                  horizontal: SizeProvider.instance.width(8)),
              child: Row(
                children: [
                  Icon(
                    Icons.sell,
                    color: ColorProvider.greySeven,
                    size: SizeProvider.instance.text(12),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: SizeProvider.instance.width(4))),
                  Text(
                      "${category[0].toUpperCase()}${category.substring(1).toLowerCase()}",
                      style: TextStyle(
                          fontFamily: TextProvider.familyNunitoSans,
                          package: TextProvider.package,
                          fontSize: SizeProvider.instance.text(12),
                          color: ColorProvider.greySeven,
                          fontWeight: FontWeight.w800))
                ],
              ))
        ]);
  }
}
