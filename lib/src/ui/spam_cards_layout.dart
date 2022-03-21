import 'package:decision_sdk/decision.dart';
import 'package:flutter/material.dart';
import 'package:spam_cards/src/ui/spam_cards_layout_content.dart';

import '../model/spam_cards_model.dart';
import '../spam_cards_service.dart';

class SpamCardsLayout implements DecisionSdkAbstractCard {
  final SpamCardsModel cardSpamModel;
  final SpamCardsService service;

  SpamCardsLayout(this.service, this.cardSpamModel);

  @override
  Future<void> callbackNo(BuildContext context) async =>
      cardSpamModel.onUnsubscribe!(senderId: cardSpamModel.senderId);

  @override
  Future<void> callbackYes(BuildContext context) async =>
      cardSpamModel.onKeep!(senderId: cardSpamModel.senderId);

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
