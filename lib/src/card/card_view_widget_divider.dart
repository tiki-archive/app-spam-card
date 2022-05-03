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
              margin: EdgeInsets.only(right: SizeProvider.instance.size(9)),
              height: 1,
              color: const Color(0xFFD8D8D8))),
      Icon(IconProvider.email_outline, size: SizeProvider.instance.size(16)),
      Expanded(
          child: Container(
              margin: EdgeInsets.only(left: SizeProvider.instance.size(10)),
              height: 1,
              color: const Color(0xFFD8D8D8))),
    ]);
  }
}
