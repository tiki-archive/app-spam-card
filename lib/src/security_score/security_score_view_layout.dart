/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'security_score_model.dart';
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
                height: MediaQuery.of(context).size.height * 0.76,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeProvider.instance.width(20)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.height(19)),
                          child: Center(
                              child: Container(
                                  height: SizeProvider.instance.height(4),
                                  width: SizeProvider.instance.width(56),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              SizeProvider.instance.width(8))),
                                      color: ColorProvider.greyThree)))),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.height(47)),
                          alignment: Alignment.center,
                          child: Text(
                            _title,
                            style: TextStyle(
                                fontFamily: TextProvider.familyNunitoSans,
                                package: TextProvider.package,
                                color: ColorProvider.tikiBlue,
                                fontSize: SizeProvider.instance.text(18),
                                fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          )),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.height(27)),
                          alignment: Alignment.topLeft,
                          child: SecurityScoreViewWidgetDesc(
                              noScore: model.security == null)),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.height(25)),
                          child: SecurityScoreViewWidgetScore(
                              security: model.security,
                              hacking: model.hacking,
                              sensitivity: model.sensitivity)),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeProvider.instance.height(25)),
                          child: const SecurityScoreViewWidgetExplain()),
                      Expanded(
                          child: Container(
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(
                                  bottom: SizeProvider.instance.height(25)),
                              child: const SecurityScoreViewWidgetButton()))
                    ]))));
  }
}
