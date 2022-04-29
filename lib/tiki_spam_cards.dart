import 'package:decision/decision.dart';
import 'src/spam_cards_service.dart';

class TikiSpamCards {
  final SpamCardsService _service;

  TikiSpamCards({Decision? decisionSdk})
      : _service = SpamCardsService(
          decision: decisionSdk ?? Decision(),
        );

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
