import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'spam_cards_view_opened.dart';
import 'spam_cards_view_sent.dart';

class SpamCardsViewDataInfoRow extends StatelessWidget {
  final String? sinceYear;
  final int? totalEmails;
  final double? opened;

  

  const SpamCardsViewDataInfoRow(
      this.sinceYear, this.totalEmails, this.opened,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: SizeProvider.instance.size(150),
              child: SpamCardsViewSent(
                totalEmails,
                sinceYear,
              )),
          Container(
              width: 1,
              height: SizeProvider.instance.size(120),
              color: const Color(0xFFD8D8D8)),
          SizedBox(
              width: SizeProvider.instance.size(150), child: SpamCardsViewOpened(opened))
        ]);
  }
}
