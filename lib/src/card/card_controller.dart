/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';

import '../security_score/security_score_service.dart';

class CardController {
  final SecurityScoreService _securityScoreService;

  CardController(this._securityScoreService);

  Future<void> openSecurityScore(BuildContext context) =>
      _securityScoreService.presenter.showModal(context);
}
