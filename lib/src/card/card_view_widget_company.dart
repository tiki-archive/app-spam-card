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
        height: SizeProvider.instance.width(70),
        width: SizeProvider.instance.width(70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: ColorProvider.greyThree,
              width: SizeProvider.instance.width(4.5)),
          color: ColorProvider.white,
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
          width: SizeProvider.instance.width(70),
          height: SizeProvider.instance.width(70),
          child: ImgProvider.companyAvatar),
      Center(
        child: Text(title[0].toUpperCase(),
            style: TextStyle(
                color: ColorProvider.tikiBlue,
                fontSize: SizeProvider.instance.text(30),
                fontWeight: FontWeight.bold,
                fontFamily: TextProvider.familyNunitoSans,
                package: TextProvider.package)),
      )
    ]);
  }

  _getCompanyName(name, email) {
    if (name != null) {
      return Text(name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeProvider.instance.text(24),
              fontWeight: FontWeight.w800,
              fontFamily: TextProvider.familyNunitoSans,
              package: TextProvider.package));
    } else {
      return Text(email,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontSize: SizeProvider.instance.text(15),
              fontWeight: FontWeight.w800,
              fontFamily: TextProvider.familyNunitoSans,
              package: TextProvider.package));
    }
  }
}
