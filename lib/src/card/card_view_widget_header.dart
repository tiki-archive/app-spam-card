/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class CardViewWidgetHeader extends StatelessWidget {
  final GlobalKey shareKey;
  final String shareMessage;
  final String provider;

  const CardViewWidgetHeader(this.shareKey, this.shareMessage, this.provider,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: SizeProvider.instance.width(24),
            right: SizeProvider.instance.width(24),
            top: SizeProvider.instance.height(8)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: Row(children: [
            Image(
                image: _fromProvider(provider).image,
                width: SizeProvider.instance.width(19)),
            Padding(
                padding:
                    EdgeInsets.only(right: SizeProvider.instance.width(7))),
            Text(
                'Your ${provider[0].toUpperCase()}${provider.substring(1).toLowerCase()} account',
                style: TextStyle(
                  fontFamily: TextProvider.familyNunitoSans,
                  package: TextProvider.package,
                  fontSize: SizeProvider.instance.text(14),
                  fontWeight: FontWeight.bold,
                  color: ColorProvider.greySix,
                ))
          ])),
          Opacity(
              opacity: 0,
              child: GestureDetector(
                  onTap: () => _share(context, shareKey, shareMessage),
                  child: Icon(Icons.share,
                      color: ColorProvider.orange,
                      size: SizeProvider.instance.height(26))))
        ]));
  }

  _share(BuildContext context, GlobalKey<State<StatefulWidget>> shareKey,
      String shareMessage) {}

  Image _fromProvider(String provider) {
    switch (provider.toLowerCase()) {
      case 'google':
        return ImgProvider.googleGmailRound;
      case 'microsoft':
        return ImgProvider.microsoftWindowsRound;
      default:
        return ImgProvider.googleGmailRound;
    }
  }
}
