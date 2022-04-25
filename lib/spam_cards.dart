import 'package:decision/decision.dart';
import 'package:spam_cards/src/spam_cards_service.dart';

import 'src/spam_cards_style.dart';

class SpamCards {
  final SpamCardsService _service;

  SpamCards({SpamCardsStyle? style, Decision? decisionSdk})
      : _service = SpamCardsService(
            decision: decisionSdk ?? Decision(),
            style: style ?? SpamCardsStyle());

  void addCards({
    Function(String senderEmail)? onUnsubscribe,
    Function(String senderEmail)? onKeep,
    required List messages,
    required String provider,
  }) =>
      _service.addCards(
        onUnsubscribe: onUnsubscribe,
        onKeep: onKeep,
        messages: messages,
        provider: provider,
      );
}
