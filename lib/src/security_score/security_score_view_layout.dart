/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'security_score_model.dart';
import 'package:tiki_style/tiki_style.dart';

import 'security_score_view_widget_button.dart';
import 'security_score_view_widget_desc.dart';
import 'security_score_view_widget_explain.dart';
import 'security_score_view_widget_score.dart';

class SecurityScoreViewLayout extends StatelessWidget {
  static const String _title = 'Security score';

  final SecurityScoreModel model;

  const SecurityScoreViewLayout(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.85,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeProvider.instance.size(20)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.size(20)),
                          child: Center(
                              child: Container(
                                  height: SizeProvider.instance.size(4),
                                  width: SizeProvider.instance.size(62),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              SizeProvider.instance.size(8))),
                                      color: const Color(0xFFD8D8D8))))),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.size(4)),
                          alignment: Alignment.center,
                          child: Text(
                            _title,
                            style: TextStyle(
                                color: const Color(0xFF00133F),
                                fontSize: SizeProvider.instance.text(15),
                                fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          )),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.size(25)),
                          alignment: Alignment.topLeft,
                          child: SecurityScoreViewWidgetDesc(
                              noScore: model.security == null)),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.size(25)),
                          child: SecurityScoreViewWidgetScore(
                              security: model.security,
                              hacking: model.hacking,
                              sensitivity: model.sensitivity)),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.size(25)),
                          child: const SecurityScoreViewWidgetExplain()),
                      Expanded(
                          child: Container(
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(
                                  bottom: SizeProvider.instance.size(25)),
                              child: const SecurityScoreViewWidgetButton()))
                    ]))));
  }
}
