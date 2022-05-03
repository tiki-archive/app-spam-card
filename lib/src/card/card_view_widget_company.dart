/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class CardViewWidgetCompany extends StatelessWidget {
  final String? logo;
  final String? name;
  final String? email;

  const CardViewWidgetCompany({Key? key, this.logo, this.name, this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getAvatar(logo, name, email),
        Padding(padding: EdgeInsets.only(top: SizeProvider.instance.size(9))),
        _getCompanyName(name, email)
      ],
    );
  }

  Widget _getAvatar(String? logo, String? name, String? email) {
    return Container(
        height: SizeProvider.instance.size(9),
        width: SizeProvider.instance.size(9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: const Color(0xFFD8D8D8),
              width: SizeProvider.instance.text(4.5)),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color(0x26000000),
                offset: Offset(0, 4),
                spreadRadius: 0,
                blurRadius: 12)
          ],
        ),
        child: ClipOval(
            child: logo != null
                ? Image.network(logo,
                    height: SizeProvider.instance.size(9),
                    errorBuilder: (context, error, stackTrace) =>
                        _staticAvatar())
                : _staticAvatar()));
  }

  Widget _staticAvatar() {
    String title = name ?? email ?? "";
    return Stack(children: [
      SizedBox(
          width: SizeProvider.instance.size(9),
          height: SizeProvider.instance.size(9),
          child: ImgProvider.companyAvatar),
      Center(
        child: Text(title[0].toUpperCase(),
            style: TextStyle(
                color: const Color(0xFF00133F),
                fontSize: SizeProvider.instance.text(30),
                fontWeight: FontWeight.bold,
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style')),
      )
    ]);
  }

  _getCompanyName(name, email) {
    if (name != null) {
      return Text(name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeProvider.instance.text(20),
              fontWeight: FontWeight.w800,
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style'));
    } else {
      return Text(email,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeProvider.instance.text(15),
              fontWeight: FontWeight.w800,
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style'));
    }
  }
}
