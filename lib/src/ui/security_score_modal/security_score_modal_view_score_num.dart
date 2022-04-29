/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class SecurityScoreModalViewScoreNum extends StatelessWidget {
  final int? score;
  final String label;
  

  SecurityScoreModalViewScoreNum(
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
                  fontSize: SizeProvider.instance.text(30),
                  fontWeight: FontWeight.bold))
          : Text("? / 10",
              style: TextStyle(
                  color: const Color(0xFFAFAFAF),
                  fontSize: SizeProvider.instance.text(30),
                  fontWeight: FontWeight.bold)),
      Text(label,
          style: TextStyle(
              color: const Color(0xFF797979),
              fontSize: SizeProvider.instance.text(11.5),
              fontFamily: TextProvider.familyNunitoSans, package: 'tiki_style',
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
