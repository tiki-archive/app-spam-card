/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class SecurityScoreViewWidgetScoreNum extends StatelessWidget {
  final int? score;
  final String label;

  SecurityScoreViewWidgetScoreNum(
      {Key? key, double? score, required this.label})
      : score = score != null ? ((1 - score) * 10).floor() : null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      score != null
          ? Text("$score / 10",
              style: TextStyle(
                  color: _getColor(score!),
                  fontFamily: TextProvider.familyNunitoSans,
                  package: TextProvider.package,
                  fontSize: SizeProvider.instance.text(36),
                  fontWeight: FontWeight.bold))
          : Text("? / 10",
              style: TextStyle(
                  color: ColorProvider.greyFour,
                  fontFamily: TextProvider.familyNunitoSans,
                  package: TextProvider.package,
                  fontSize: SizeProvider.instance.text(36),
                  fontWeight: FontWeight.bold)),
      Text(label,
          style: TextStyle(
              color: ColorProvider.greySix,
              fontSize: SizeProvider.instance.text(14),
              fontFamily: TextProvider.familyNunitoSans,
              package: TextProvider.package,
              fontWeight: FontWeight.bold))
    ]);
  }

  Color _getColor(int score) {
    if (score < 4) {
      return const Color(0xFFC73000);
    } else if (score < 7) {
      return const Color(0xFFE89933);
    } else {
      return const Color(0xFF00B272);
    }
  }
}
