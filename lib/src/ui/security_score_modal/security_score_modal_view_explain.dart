/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SecurityScoreModalViewExplain extends StatelessWidget {
  static const String _textHacking =
      'A rating based on known recent security breaches/hacks (from ';
  static const String _textSensitivity =
      'A rating based on the sensitivity of the business emailing you, for example whether they are holding medical or financial information vs a clothing company. We find this information at ';
  static const String _labelSensitivity = 'SENSITIVITY SCORE';
  static const String _labelHacking = 'HACKING SCORE';
  static const String _linkSensitivity = 'bigpicture.io';
  static const String _linkHacking = 'haveibeenpwned.com';

  const SecurityScoreModalViewExplain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _label(_labelSensitivity),
      Container(
          margin: EdgeInsets.only(top: SizeProvider.instance.size(4)),
          child: _text(
              text: _textSensitivity, link: _linkSensitivity, close: '.')),
      Container(
          margin: EdgeInsets.only(top: SizeProvider.instance.size(8)),
          child: _label(_labelHacking)),
      Container(
          margin: EdgeInsets.only(top: SizeProvider.instance.size(4)),
          child: _text(text: _textHacking, link: _linkHacking, close: ')')),
    ]);
  }

  Widget _label(String label) {
    return Text(label,
        textAlign: TextAlign.left,
        style: const TextStyle(
            color: Color(0xFF797979), fontWeight: FontWeight.bold));
  }

  Widget _text(
      {required String text, required String link, required String close}) {
    return RichText(
        text: TextSpan(
            text: text,
            style: TextStyle(
                color: const Color(0xFF00133F),
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',
                fontSize: SizeProvider.instance.text(11.5),
                fontWeight: FontWeight.w600),
            children: [
          TextSpan(
              text: link,
              recognizer: TapGestureRecognizer()
                ..onTap = () async => _launchURL('https://' + link),
              style: TextStyle(
                  color: const Color(0xFFFF521C),
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                  fontSize: SizeProvider.instance.text(11.5),
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: close,
              style: TextStyle(
                  color: const Color(0xFF00133F),
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                  fontSize: SizeProvider.instance.text(11.5),
                  fontWeight: FontWeight.w600))
        ]));
  }

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}
