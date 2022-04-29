/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'security_score_modal_view_score_num.dart';

class SecurityScoreModalViewScore extends StatelessWidget {
  static const String _leadIn =
      'The security score is determined by two ratings:';
  static const String _labelSensitivity = 'SENSITIVITY';
  static const String _labelHacking = 'HACKING';
  final double? hacking;
  final double? sensitivity;
  final double? security;

  const SecurityScoreModalViewScore(
      {Key? key, this.hacking, this.sensitivity, this.security})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(_leadIn,
          style: TextStyle(
              color: const Color(0xFF00133F),
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style',
              fontSize: SizeProvider.instance.text(11.5),
              fontWeight: FontWeight.w600)),
      if (security != null)
        Container(
            margin: EdgeInsets.only(top: SizeProvider.instance.size(25)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SecurityScoreModalViewScoreNum(
                    score: sensitivity,
                    label: _labelSensitivity,
                  ),
                  Container(
                    width: 1,
                    height: SizeProvider.instance.size(65),
                    color: const Color(0xFFAFAFAF),
                  ),
                  SecurityScoreModalViewScoreNum(
                    score: hacking,
                    label: _labelHacking,
                  ),
                ])),
    ]);
  }
}
