/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'security_score_service.dart';
import 'security_score_view_layout.dart';

class SecurityScorePresenter {
  final SecurityScoreService _service;

  SecurityScorePresenter(this._service);

  Future<void> showModal(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(SizeProvider.instance.size(26)))),
        builder: (BuildContext context) =>
            SecurityScoreViewLayout(_service.model));
  }
}
