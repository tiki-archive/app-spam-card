/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class SecurityScoreModalViewDesc extends StatelessWidget {
  static const String _empty =
      'We’re sorry that we cannot provide you with a\nsecurity score for this email list right now.\nFind out more info about security score below.';
  static const String _text1 =
      'For each email list that emails you, we show you a rating which we call a ';
  static const String _text2 = 'Security score.';

  final bool noScore;
  

  const SecurityScoreModalViewDesc(
      {Key? key, this.noScore = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (noScore)
          Container(
              margin: EdgeInsets.only(bottom: SizeProvider.instance.size(25)),
              child: Text(_empty,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: const Color(0xFFC73000),
                      fontFamily: TextProvider.familyNunitoSans,
                      package: 'tiki_style',
                      fontSize: SizeProvider.instance.text(11.5),
                      fontWeight: FontWeight.w600))),
        RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: _text1,
                style: TextStyle(
                    color: const Color(0xFF00133F),
                    fontFamily: TextProvider.familyNunitoSans,
                    package: 'tiki_style',
                    fontSize: SizeProvider.instance.text(11.5),
                    fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                      text: _text2,
                      style: TextStyle(
                          color: const Color(0xFF00133F),
                          fontFamily: TextProvider.familyNunitoSans,
                          package: 'tiki_style',
                          fontSize: SizeProvider.instance.text(11.5),
                          fontWeight: FontWeight.w800))
                ])),
      ],
    );
  }
}
