import 'package:flutter/material.dart';

import '../spam_cards_style.dart';
import 'spam_cards_view_opened.dart';
import 'spam_cards_view_sent.dart';

class SpamCardsViewDataInfoRow extends StatelessWidget {
  final String? sinceYear;
  final int? totalEmails;
  final double? opened;

  final SpamCardsStyle style;

  const SpamCardsViewDataInfoRow(
      this.sinceYear, this.totalEmails, this.opened, this.style,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: style.size(150),
              child: SpamCardsViewSent(
                totalEmails,
                sinceYear,
                style: style,
              )),
          Container(
              width: 1,
              height: style.size(120),
              color: const Color(0xFFD8D8D8)),
          SizedBox(
              width: style.size(150), child: SpamCardsViewOpened(opened, style))
        ]);
  }
}
