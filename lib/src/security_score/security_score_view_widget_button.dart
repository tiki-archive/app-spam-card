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
        primary: Colors.white,
        backgroundColor: const Color(0xFFFF521C),
        padding: EdgeInsets.symmetric(vertical: SizeProvider.instance.size(14)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(SizeProvider.instance.size(10)))),
      ),
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: SizeProvider.instance.text(26),
          child: Text(_text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeProvider.instance.text(13),
                fontWeight: FontWeight.bold,
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',
              ))),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
