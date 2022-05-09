/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class CardViewWidgetDivider extends StatelessWidget {
  const CardViewWidgetDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
          child: Container(
              margin: EdgeInsets.only(right: SizeProvider.instance.width(9)),
              height: 1,
              color: ColorProvider.greyThree)),
      SizedBox(
          width: SizeProvider.instance.width(30),
          child: Icon(
            IconProvider.email_outline,
            color: ColorProvider.greyFour,
            size: SizeProvider.instance.height(16.5),
          )),
      Expanded(
          child: Container(
              margin: EdgeInsets.only(left: SizeProvider.instance.width(10)),
              height: 1,
              color: ColorProvider.greyThree)),
    ]);
  }
}
