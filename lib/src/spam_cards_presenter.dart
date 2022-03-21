import 'package:flutter/material.dart';
import 'package:spam_cards/src/model/security_score_modal_model.dart';
import 'package:spam_cards/src/spam_cards_service.dart';

import 'ui/security_score_modal/security_score_modal_layout.dart';

class SpamCardsPresenter {
  SpamCardsService service;
  SpamCardsPresenter(this.service);

  Future<void> showModal(BuildContext context, SecurityScoreModalModel model) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(service.style.size(26)))),
        builder: (BuildContext context) =>
            SecurityScoreModalLayout(model, service.style));
  }
}
