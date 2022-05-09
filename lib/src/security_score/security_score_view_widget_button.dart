/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class SecurityScoreViewWidgetButton extends StatelessWidget {
  static const String _text = 'OK, got it';

  const SecurityScoreViewWidgetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: ColorProvider.white,
        backgroundColor: ColorProvider.orange,
        padding:
            EdgeInsets.symmetric(vertical: SizeProvider.instance.height(14)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(SizeProvider.instance.width(10)))),
      ),
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: SizeProvider.instance.height(26),
          child: Text(_text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeProvider.instance.text(16),
                fontWeight: FontWeight.bold,
                fontFamily: TextProvider.familyNunitoSans,
                package: TextProvider.package,
              ))),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
