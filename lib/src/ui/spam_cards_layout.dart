import 'package:decision/decision.dart';
import 'package:flutter/material.dart';

import '../model/spam_cards_model.dart';
import '../spam_cards_service.dart';
import '../ui/spam_cards_layout_content.dart';

class SpamCardsLayout implements DecisionAbstractCard {
  final SpamCardsModel cardSpamModel;
  final SpamCardsService service;

  SpamCardsLayout(this.service, this.cardSpamModel);

  @override
  Future<void> callbackNo(BuildContext context) async =>
      cardSpamModel.onUnsubscribe != null
          ? cardSpamModel.onUnsubscribe!(cardSpamModel.senderEmail)
          : null;

  @override
  Future<void> callbackYes(BuildContext context) async =>
      cardSpamModel.onKeep != null
          ? cardSpamModel.onKeep!(cardSpamModel.senderEmail)
          : null;

  @override
  Widget content(BuildContext context) {
    var shareKey = GlobalKey();
    return Container(
        key: shareKey,
        color: Colors.white,
        child: SpamCardsLayoutContent(shareKey, service, cardSpamModel));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpamCardsLayout &&
          runtimeType == other.runtimeType &&
          cardSpamModel == other.cardSpamModel &&
          service == other.service;

  @override
  int get hashCode => cardSpamModel.hashCode ^ service.hashCode;
}
