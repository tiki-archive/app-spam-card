/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'card_service.dart';
import 'card_view_widget_company.dart';
import 'card_view_widget_divider.dart';
import 'card_view_widget_freq.dart';
import 'card_view_widget_header.dart';
import 'card_view_widget_info.dart';
import 'card_view_widget_security.dart';

class CardViewLayout extends StatelessWidget {
  final GlobalKey shareKey = GlobalKey();
  final CardService service;

  CardViewLayout(this.service, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        key: shareKey,
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardViewWidgetHeader(
                  shareKey, "mensagem", service.model.strategy),
              Padding(
                  padding: EdgeInsets.only(
                      left: SizeProvider.instance.size(12),
                      right: SizeProvider.instance.size(12),
                      top: SizeProvider.instance.size(16)),
                  child: CardViewWidgetCompany(
                    logo: service.model.logoUrl,
                    name: service.model.companyName,
                    email: service.model.senderEmail,
                  )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: SizeProvider.instance.size(18),
                          right: SizeProvider.instance.size(18),
                          top: SizeProvider.instance.size(16),
                          bottom: SizeProvider.instance.size(20)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              SizeProvider.instance.size(16)),
                          color: const Color(0xFFF8F8F8)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: SizeProvider.instance.size(24)),
                                child: CardViewWidgetFreq(
                                  service.model.frequency.toString(),
                                  service.model.category.toString(),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: SizeProvider.instance.size(16),
                                    left: SizeProvider.instance.size(25),
                                    right: SizeProvider.instance.size(25)),
                                child: const CardViewWidgetDivider()),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: SizeProvider.instance.size(8)),
                                child: CardViewWidgetInfo(
                                  service.model.sinceYear,
                                  service.model.totalEmails,
                                  service.model.openRate,
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: SizeProvider.instance.size(20)),
                                child: CardViewWidgetSecurity(
                                    service.controller,
                                    security: service.model.securityScore,
                                    sensitivity: service.model.sensitivityScore,
                                    hacking: service.model.hackingScore))
                          ])))
            ]));
  }
}
