import 'package:flutter/material.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:tiki_decision/tiki_decision.dart';
import 'package:tiki_kv/tiki_kv.dart';
import 'package:tiki_spam_cards/tiki_spam_cards.dart';
import 'package:tiki_style/tiki_style.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Database database = await openDatabase('${Uuid().v4()}.db');
  TikiKv tikiKv = await TikiKv(database: database).init();
  TikiDecision decision =
      await TikiDecision(tikiKv: tikiKv, isLinked: true).init();
  TikiSpamCards spamCards = TikiSpamCards(decision);

  spamCards.upsert({
    CardModel(
        strategy: 'google',
        companyName: 'Company Name',
        frequency: 'daily',
        category: 'Promotions',
        sinceYear: '2009',
        totalEmails: 202,
        openRate: 0.5,
        securityScore: 0.5,
        hackingScore: 0.5,
        sensitivityScore: 0.5)
  });

  runApp(MaterialApp(
    title: 'SpamCard Example',
    theme: ThemeData(),
    home: Scaffold(
      body: Widgety(decision),
    ),
  ));
}

class Widgety extends StatelessWidget {
  final TikiDecision decision;

  Widgety(this.decision);

  @override
  Widget build(BuildContext context) {
    TikiStyle style = TikiStyle.init(context);
    return decision.widget;
  }
}
