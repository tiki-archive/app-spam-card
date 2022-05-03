/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'security_score_controller.dart';
import 'security_score_model.dart';
import 'security_score_presenter.dart';

class SecurityScoreService {
  final SecurityScoreModel model;
  late final SecurityScoreController controller;
  late final SecurityScorePresenter presenter;

  SecurityScoreService(this.model) {
    controller = SecurityScoreController(this);
    presenter = SecurityScorePresenter(this);
  }
}
