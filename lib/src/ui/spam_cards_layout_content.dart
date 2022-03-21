import 'package:flutter/material.dart';
import 'package:spam_cards/src/ui/spam_cards_view_header.dart';

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
                  left: service.style.size(12),
                  right: service.style.size(12),
                  top: service.style.size(16)),
              child: SpamCardsViewCompany(
                logo: cardSpamModel.logoUrl,
                name: cardSpamModel.companyName,
                email: cardSpamModel.senderEmail,
                style: service.style,
              )),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(
                      left: service.style.size(18),
                      right: service.style.size(18),
                      top: service.style.size(16),
                      bottom: service.style.size(20)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(service.style.size(16)),
                      color: const Color(0xFFF8F8F8)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(top: service.style.size(24)),
                            child: SpamCardsViewFrequency(
                                cardSpamModel.frequency.toString(),
                                cardSpamModel.category.toString(),
                                service.style)),
                        Padding(
                            padding: EdgeInsets.only(
                                top: service.style.size(16),
                                left: service.style.size(25),
                                right: service.style.size(25)),
                            child:
                                SpamCardsViewSeparator(style: service.style)),
                        Padding(
                            padding:
                                EdgeInsets.only(top: service.style.size(8)),
                            child: SpamCardsViewDataInfoRow(
                                cardSpamModel.sinceYear,
                                cardSpamModel.totalEmails,
                                cardSpamModel.openRate,
                                service.style)),
                        Padding(
                            padding:
                                EdgeInsets.only(top: service.style.size(20)),
                            child: SpamCardsViewSecurity(
                              security: cardSpamModel.securityScore,
                              sensitivity: cardSpamModel.sensitivityScore,
                              hacking: cardSpamModel.hackingScore,
                              style: service.style,
                            ))
                      ])))
        ]);
  }
}
