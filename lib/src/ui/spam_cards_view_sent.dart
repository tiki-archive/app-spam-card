/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class SpamCardsViewSent extends StatelessWidget {
  final int? totalEmails;
  final String? sinceYear;
  

  const SpamCardsViewSent(this.totalEmails, this.sinceYear,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("They've sent you",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF00133F),
                fontSize: SizeProvider.instance.text(10))),
        Padding(padding: EdgeInsets.only(bottom: SizeProvider.instance.size(2))),
        Text(
          totalEmails.toString(),
          style: TextStyle(
              fontFamily: TextProvider.familyKoara, package: 'tiki_style',
              fontSize: SizeProvider.instance.text(45),
              fontWeight: FontWeight.bold),
        ),
        Text(totalEmails != null && totalEmails! > 1 ? "emails" : "email",
            style: TextStyle(
                height: 0.5,
                fontWeight: FontWeight.w800,
                fontSize: SizeProvider.instance.text(10))),
        Padding(padding: EdgeInsets.only(bottom: SizeProvider.instance.size(14))),
        ClipRRect(
            borderRadius: BorderRadius.circular(SizeProvider.instance.size(5)),
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeProvider.instance.size(8), horizontal: SizeProvider.instance.size(7)),
                color: const Color(0xFF00133F),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        child: Icon(Icons.calendar_today,
                            color: Colors.white, size: SizeProvider.instance.text(9)),
                        padding: EdgeInsets.only(right: SizeProvider.instance.size(15))),
                    Text(
                      " since ${sinceYear.toString()}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeProvider.instance.text(10),
                          fontWeight: FontWeight.w800),
                    )
                  ],
                )))
      ],
    );
  }
}
