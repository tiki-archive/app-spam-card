import 'package:flutter/material.dart';
import 'package:spam_cards/src/model/security_score_modal_model.dart';
import 'package:spam_cards/src/spam_cards_service.dart';

class SpamCardsPresenter {
  SpamCardsService service;
  SpamCardsPresenter(this.service);

  showModal(
      BuildContext context, SecurityScoreModalModel securityScoreModalModel) {}
}
