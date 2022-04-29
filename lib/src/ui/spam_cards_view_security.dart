import 'package:flutter/material.dart';
import 'package:spam_cards/src/spam_cards_service.dart';
import 'package:tiki_style/tiki_style.dart';

import '../model/security_score_modal_model.dart';

class SpamCardsViewSecurity extends StatelessWidget {
  final double? security;
  final double? sensitivity;
  final double? hacking;
  
  final SpamCardsService service;

  const SpamCardsViewSecurity(
      {Key? key,
      double? security,
      required this.service,
      this.sensitivity,
      this.hacking})
      : security = security != null ? (1 - security) * 5 : null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getStars(service)),
      Padding(
        padding: EdgeInsets.only(top: SizeProvider.instance.size(4)),
      ),
      security != null
          ? RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: TextProvider.familyKoara, package: 'tiki_style',
                      color: const Color(0xFF8D8D8D),
                      fontSize: SizeProvider.instance.text(15)),
                  text: "Your data is ",
                  children: [
                    TextSpan(
                        text: _getSecurityText(security ?? 0),
                        style: TextStyle(color: _getColorForText())),
                    _getInfoIcon(context, service)
                  ]),
            )
          : RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: TextProvider.familyKoara, package: 'tiki_style',
                      color: const Color(0xFF8D8D8D),
                      fontSize: SizeProvider.instance.text(15)),
                  text: "No data score info yet",
                  children: [_getInfoIcon(context, service)]),
            ),
    ]);
  }

  List<Widget> _getStars(SpamCardsService service) {
    var color = _getColor();
    var starRate = security ?? 0;
    var stars = <Widget>[];
    for (int i = 0; i < 5; i++) {
      if (i >= starRate.floor() && i < starRate.ceil()) {
        stars.add(Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeProvider.instance.size(4)),
            child: Stack(children: [
              Icon(IconProvider.star,
                  size:SizeProvider.instance.size(20),
                  color:ColorProvider.greyThree),
              ClipRect(
                child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.5,
                    child: Icon(IconProvider.star, size: SizeProvider.instance.size(20), color: color))
              ),
            ])));
      } else if (i >= starRate.ceil()) {
        stars.add(Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeProvider.instance.size(2)),
            child: Icon(IconProvider.star, size: SizeProvider.instance.size(20), color: ColorProvider.greyFour)));
      } else {
        stars.add(Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeProvider.instance.size(2)),
            child: Icon(IconProvider.star, size: SizeProvider.instance.size(20), color: color)));
      }
    }
    return stars;
  }

  Color _getColor() {
    if (security == null) {
      return ColorProvider.greyFour;
    } else {
      var starRate = security ?? 0;
      if (starRate < 2) {
        return ColorProvider.red;
      } else if (starRate < 4) {
        return ColorProvider.yellow;
      } else {
        return ColorProvider.green;
      }
    }
  }

  Color _getColorForText() {
    var starRates = security ?? 0;
    if (security == null) {
      return const Color(0xFF797979);
    } else {
      if (starRates < 2) {
        return const Color(0xFFC73000);
      } else if (starRates < 4) {
        return const Color(0xFFE89933);
      } else {
        return const Color(0xFF00B272);
      }
    }
  }

  String _getSecurityText(num starRate) {
    if (starRate < 2) {
      return "not safe";
    } else if (starRate < 4) {
      return "somewhat safe";
    } else {
      return "very safe";
    }
  }

  _getInfoIcon(BuildContext context, SpamCardsService service) {
    return WidgetSpan(
        child: Padding(
            padding: EdgeInsets.only(
              left: SizeProvider.instance.size(13),
            ),
            child: GestureDetector(
                child: Icon(
                  Icons.info_outline_rounded,
                  color: const Color(0xFF8D8D8D),
                  size: SizeProvider.instance.text(17),
                ),
                onTap: () => service.presenter.showModal(
                    context,
                    SecurityScoreModalModel(
                        hacking: hacking,
                        sensitivity: sensitivity,
                        security: security)))));
  }
}
