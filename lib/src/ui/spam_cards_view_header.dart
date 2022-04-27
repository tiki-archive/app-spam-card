import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../spam_cards_service.dart';

class SpamCardsViewHeader extends StatelessWidget {
  final GlobalKey shareKey;
  final String shareMessage;
  final String provider;
  final SpamCardsService service;

  const SpamCardsViewHeader(
      this.service, this.shareKey, this.shareMessage, this.provider,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: SizeProvider.instance.size(24),
            right: SizeProvider.instance.size(24),
            top: SizeProvider.instance.size(8)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: Row(children: [
              ImgProvider.getByName("${provider}_round_logo.png",
                width: SizeProvider.instance.size(20)),
            Padding(padding: EdgeInsets.only(right: SizeProvider.instance.size(7))),
            Text("Your $provider account",
                style: TextStyle(
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                  fontSize: SizeProvider.instance.text(12),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF797979),
                ))
          ])),
          Opacity(
              opacity: 0,
              child: GestureDetector(
                  onTap: () => _share(context, shareKey, shareMessage),
                  child: Icon(Icons.share,
                      color: const Color(0xFFFF521C),
                      size: SizeProvider.instance.size(24))))
        ]));
  }

  _share(BuildContext context, GlobalKey<State<StatefulWidget>> shareKey,
      String shareMessage) {}
}
