/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:tiki_decision/tiki_decision.dart';

import 'src/card/card_model.dart';
import 'src/card/card_service.dart';

export 'src/card/card_model.dart';

class TikiSpamCard {
  final TikiDecision _decision;

  const TikiSpamCard(this._decision);

  void upsert(List<CardModel> cards) => _decision.upsert(Map.fromEntries(cards
      .map((e) => MapEntry('${e.strategy}.${e.senderEmail}', CardService(e)))));

  String calculateFrequency(List<DateTime> received) {
    const int secsInDay = 86400;
    const int secsInWeek = 604800;
    const int secsInMonth = 2629746;

    if (received.length == 1) return "once";

    received.sort((a, b) => a.isBefore(b) ? -1 : 1);
    List<Duration> freq = [];
    for (int i = 0; i < received.length - 1; i++) {
      freq.add(received[i].difference(received[i + 1]));
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

  double calculateOpenRate(List<DateTime?> didOpen) {
    int opened = 0;
    int total = didOpen.length;
    for (DateTime? open in didOpen) {
      if (open != null) opened++;
    }
    return opened / total;
  }
}
