/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class CardViewWidgetSent extends StatelessWidget {
  final int? totalEmails;
  final String? sinceYear;

  const CardViewWidgetSent(this.totalEmails, this.sinceYear, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("They've sent you",
            style: TextStyle(
                fontFamily: TextProvider.familyNunitoSans,
                package: TextProvider.package,
                fontWeight: FontWeight.w600,
                color: ColorProvider.tikiBlue,
                fontSize: SizeProvider.instance.text(12))),
        Padding(
            padding: EdgeInsets.only(bottom: SizeProvider.instance.height(12))),
        Text(
          totalEmails.toString(),
          style: TextStyle(
              color: ColorProvider.tikiBlue,
              fontFamily: TextProvider.familyKoara,
              package: TextProvider.package,
              fontSize: SizeProvider.instance.text(50),
              fontWeight: FontWeight.bold),
        ),
        Text(totalEmails != null && totalEmails! > 1 ? "emails" : "email",
            style: TextStyle(
                height: 0.5,
                fontFamily: TextProvider.familyNunitoSans,
                package: TextProvider.package,
                fontWeight: FontWeight.w800,
                color: ColorProvider.tikiBlue,
                fontSize: SizeProvider.instance.text(12))),
        Padding(
            padding: EdgeInsets.only(bottom: SizeProvider.instance.height(20))),
        ClipRRect(
            borderRadius: BorderRadius.circular(SizeProvider.instance.width(6)),
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeProvider.instance.height(3),
                    horizontal: SizeProvider.instance.width(8)),
                color: ColorProvider.tikiBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        child: Icon(Icons.calendar_today,
                            color: Colors.white,
                            size: SizeProvider.instance.text(10)),
                        padding: EdgeInsets.only(
                            right: SizeProvider.instance.width(4))),
                    Text(
                      " since ${sinceYear.toString()}",
                      style: TextStyle(
                          fontFamily: TextProvider.familyNunitoSans,
                          package: TextProvider.package,
                          color: Colors.white,
                          fontSize: SizeProvider.instance.text(12),
                          fontWeight: FontWeight.w800),
                    )
                  ],
                )))
      ],
    );
  }
}
