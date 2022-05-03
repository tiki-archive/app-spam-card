/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class CardModel {
  String? logoUrl;
  String? companyName;
  String? category;
  String? frequency;
  String? sinceYear;
  int? totalEmails;
  double? openRate;
  double? securityScore;
  double? sensitivityScore;
  double? hackingScore;
  String? senderEmail;
  String strategy;
  Function? onUnsubscribe;
  Function? onKeep;

  CardModel(
      {required this.strategy,
      this.logoUrl,
      this.category,
      required this.companyName,
      required this.frequency,
      this.sinceYear,
      this.totalEmails,
      required this.openRate,
      this.securityScore,
      this.sensitivityScore,
      this.hackingScore,
      this.senderEmail,
      this.onUnsubscribe,
      this.onKeep});
}
