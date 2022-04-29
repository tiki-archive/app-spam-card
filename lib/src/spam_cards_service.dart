import 'package:decision/decision.dart';
import 'package:flutter/cupertino.dart';

import 'model/spam_cards_model.dart';
import 'spam_cards_presenter.dart';
import 'ui/spam_cards_layout.dart';

class SpamCardsService extends ChangeNotifier {
  final Decision decision;
  late final SpamCardsPresenter presenter;

  SpamCardsService({required this.decision}) {
    presenter = SpamCardsPresenter(this);
  }

  Future<void> addCards(
      {Function(String senderEmail)? onUnsubscribe,
      Function(String senderEmail)? onKeep,
      required String provider,
      required List messages}) async {
    if (messages.isNotEmpty) {
      List<SpamCardsModel> spamModels = [];
      String calculatedFrequency = _calculateFrequency(messages);
      double calculatedOpenRate = _calculateOpenRate(messages);
      spamModels.add(SpamCardsModel.fromMessageList(
          messages: messages,
          calculatedFrequency: calculatedFrequency,
          calculatedOpenRate: calculatedOpenRate,
          provider: provider,
          onKeep: onKeep,
          onUnsubscribe: onUnsubscribe));
      decision.addCards(spamModels
          .map((spamModel) => SpamCardsLayout(this, spamModel))
          .toList());
    }
  }

  String _calculateFrequency(List<dynamic> messages) {
    const int secsInDay = 86400;
    const int secsInWeek = 604800;
    const int secsInMonth = 2629746;

    if (messages.length == 1) return "once";

    messages.sort((a, b) => a.receivedDate!.isBefore(b.receivedDate!) ? -1 : 1);
    List<Duration> freq = [];
    for (int i = 0; i < messages.length - 1; i++) {
      freq.add(
          messages[i].receivedDate!.difference(messages[i + 1].receivedDate!));
    }
    double avgSeconds = 0;
    freq.map((f) => f.inSeconds).forEach((f) => avgSeconds += f);
    avgSeconds = (avgSeconds / freq.length).abs();

    if (avgSeconds <= secsInDay) {
      return "daily";
    } else if (avgSeconds <= secsInWeek) {
      return "weekly";
    } else if (avgSeconds <= secsInMonth) {
      return "monthly";
    } else if (avgSeconds <= secsInMonth * 3) {
      return "quarterly";
    } else if (avgSeconds <= secsInMonth * 6) {
      return "semiannually";
    } else {
      return "annually";
    }
  }

  double _calculateOpenRate(List<dynamic> messages) {
    int opened = 0;
    int total = messages.length;
    for (var message in messages) {
      if (message.openedDate != null) opened++;
    }
    return opened / total;
  }
}
