/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:tiki_decision/tiki_decision_card.dart';

import '../security_score/security_score_model.dart';
import '../security_score/security_score_service.dart';
import 'card_controller.dart';
import 'card_model.dart';
import 'card_view_layout.dart';

class CardService implements TikiDecisionCard {
  final CardModel model;
  late final CardController controller;
  late final SecurityScoreService _securityScoreService;

  CardService(this.model) {
    controller = CardController(SecurityScoreService(SecurityScoreModel(
        security: model.securityScore,
        hacking: model.hackingScore,
        sensitivity: model.sensitivityScore)));
  }

  @override
  Future<void> callbackNo() async {
    if (model.onUnsubscribe != null) await model.onUnsubscribe!();
  }

  @override
  Future<void> callbackYes() async {
    if (model.onKeep != null) await model.onKeep!();
  }

  @override
  Widget content() => CardViewLayout(this);
}
