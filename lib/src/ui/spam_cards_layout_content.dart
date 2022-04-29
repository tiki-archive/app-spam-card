import 'package:flutter/material.dart';
import 'package:spam_cards/src/ui/spam_cards_view_header.dart';
import 'package:tiki_style/tiki_style.dart';

import '../model/spam_cards_model.dart';
import '../spam_cards_service.dart';
import 'spam_cards_view_company.dart';
import 'spam_cards_view_data_info_row.dart';
import 'spam_cards_view_frequency.dart';
import 'spam_cards_view_security.dart';
import 'spam_cards_view_separator.dart';

class SpamCardsLayoutContent extends StatelessWidget {
  final GlobalKey shareKey;

  final SpamCardsModel cardSpamModel;
  final SpamCardsService service;

  const SpamCardsLayoutContent(this.shareKey, this.service, this.cardSpamModel,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpamCardsViewHeader(
              service, shareKey, "mensagem", cardSpamModel.provider),
          Padding(
              padding: EdgeInsets.only(
                  left: SizeProvider.instance.size(12),
                  right: SizeProvider.instance.size(12),
                  top: SizeProvider.instance.size(16)),
              child: SpamCardsViewCompany(
                logo: cardSpamModel.logoUrl,
                name: cardSpamModel.companyName,
                email: cardSpamModel.senderEmail,
              )),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(
                      left: SizeProvider.instance.size(18),
                      right: SizeProvider.instance.size(18),
                      top: SizeProvider.instance.size(16),
                      bottom: SizeProvider.instance.size(20)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeProvider.instance.size(16)),
                      color: const Color(0xFFF8F8F8)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(top: SizeProvider.instance.size(24)),
                            child: SpamCardsViewFrequency(
                                cardSpamModel.frequency.toString(),
                                cardSpamModel.category.toString(),
                                )),
                        Padding(
                            padding: EdgeInsets.only(
                                top: SizeProvider.instance.size(16),
                                left: SizeProvider.instance.size(25),
                                right: SizeProvider.instance.size(25)),
                            child:
                                const SpamCardsViewSeparator()),
                        Padding(
                            padding:
                                EdgeInsets.only(top: SizeProvider.instance.size(8)),
                            child: SpamCardsViewDataInfoRow(
                                cardSpamModel.sinceYear,
                                cardSpamModel.totalEmails,
                                cardSpamModel.openRate,)),
                        Padding(
                            padding:
                                EdgeInsets.only(top: SizeProvider.instance.size(20)),
                            child: SpamCardsViewSecurity(
                              service: service,
                              security: cardSpamModel.securityScore,
                              sensitivity: cardSpamModel.sensitivityScore,
                              hacking: cardSpamModel.hackingScore
                            ))
                      ])))
        ]);
  }
}
