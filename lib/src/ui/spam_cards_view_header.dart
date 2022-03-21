import 'package:flutter/material.dart';

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
            left: service.style.size(24),
            right: service.style.size(24),
            top: service.style.size(8)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: Row(children: [
            Image.asset("res/images/$provider-round-logo.png",
                width: service.style.size(20)),
            Padding(padding: EdgeInsets.only(right: service.style.size(7))),
            Text("Your $provider account",
                style: TextStyle(
                  fontFamily: service.style.textFont,
                  fontSize: service.style.text(12),
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
                      size: service.style.size(24))))
        ]));
  }

  _share(BuildContext context, GlobalKey<State<StatefulWidget>> shareKey,
      String shareMessage) {}
}
