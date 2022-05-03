/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'card_view_widget_opened.dart';
import 'card_view_widget_sent.dart';

class CardViewWidgetInfo extends StatelessWidget {
  final String? sinceYear;
  final int? totalEmails;
  final double? opened;

  const CardViewWidgetInfo(this.sinceYear, this.totalEmails, this.opened,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: SizeProvider.instance.size(150),
              child: CardViewWidgetSent(
                totalEmails,
                sinceYear,
              )),
          Container(
              width: 1,
              height: SizeProvider.instance.size(120),
              color: const Color(0xFFD8D8D8)),
          SizedBox(
              width: SizeProvider.instance.size(150),
              child: CardViewWidgetOpened(opened))
        ]);
  }
}
