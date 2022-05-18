/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'card_controller.dart';

class CardViewWidgetSecurity extends StatelessWidget {
  final CardController controller;
  final double? security;
  final double? sensitivity;
  final double? hacking;

  const CardViewWidgetSecurity(this.controller,
      {Key? key, double? security, this.sensitivity, this.hacking})
      : security = security != null ? (1 - security) * 5 : null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
        children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: _getStars()),
      Padding(
        padding: EdgeInsets.only(top: SizeProvider.instance.height(13)),
      ),
      security != null
          ? RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: TextProvider.familyKoara,
                      package: TextProvider.package,
                      color: ColorProvider.greyFive,
                      fontSize: SizeProvider.instance.text(18)),
                  text: "Your data is ",
                  children: [
                    TextSpan(
                        text: _getSecurityText(security ?? 0),
                        style: TextStyle(color: _getColorForText())),
                    _getInfoIcon(context)
                  ]),
            )
          : RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: TextProvider.familyKoara,
                      package: TextProvider.package,
                      color: ColorProvider.greyFive,
                      fontSize: SizeProvider.instance.text(18)),
                  text: "No data score info yet",
                  children: [_getInfoIcon(context)]),
            ),
    ]);
  }

  List<Widget> _getStars() {
    var color = _getColor();
    var starRate = security ?? 0;
    var stars = <Widget>[];
    for (int i = 0; i < 5; i++) {
      if (i >= starRate.floor() && i < starRate.ceil()) {
        stars.add(Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeProvider.instance.height(4)),
            child: Stack(children: [
              Icon(IconProvider.star,
                  size: SizeProvider.instance.text(21),
                  color: ColorProvider.greyThree),
              ClipRect(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.5,
                      child: Icon(IconProvider.star,
                          size: SizeProvider.instance.text(21), color: color))),
            ])));
      } else if (i >= starRate.ceil()) {
        stars.add(Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeProvider.instance.width(2)),
            child: Icon(IconProvider.star,
                size: SizeProvider.instance.text(21),
                color: ColorProvider.greyThree)));
      } else {
        stars.add(Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeProvider.instance.width(2)),
            child: Icon(IconProvider.star,
                size: SizeProvider.instance.text(21), color: color)));
      }
    }
    return stars;
  }

  Color _getColor() {
    if (security == null) {
      return ColorProvider.greyThree;
    } else {
      var starRate = security ?? 0;
      if (starRate < 2) {
        return ColorProvider.tikiRed;
      } else if (starRate < 4) {
        return ColorProvider.tikiOrange;
      } else {
        return ColorProvider.green;
      }
    }
  }

  Color _getColorForText() {
    var starRates = security ?? 0;
    if (security == null) {
      return ColorProvider.greySix;
    } else {
      if (starRates < 2) {
        return ColorProvider.tikiRed;
      } else if (starRates < 4) {
        return ColorProvider.tikiOrange;
      } else {
        return ColorProvider.green;
      }
    }
  }

  String _getSecurityText(num starRate) {
    if (starRate < 2) {
      return "not safe";
    } else if (starRate < 4) {
      return "somewhat safe";
    } else {
      return "very safe";
    }
  }

  _getInfoIcon(BuildContext context) {
    return WidgetSpan(
        child: Padding(
            padding: EdgeInsets.only(left: SizeProvider.instance.width(7)),
            child: GestureDetector(
                child: Icon(
                  Icons.info_outline_rounded,
                  color: ColorProvider.greyFive,
                  size: SizeProvider.instance.text(20),
                ),
                onTap: () => controller.openSecurityScore(context))));
  }
}
