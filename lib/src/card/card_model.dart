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
  Future<void> Function()? onUnsubscribe;
  Future<void> Function()? onKeep;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModel &&
          runtimeType == other.runtimeType &&
          logoUrl == other.logoUrl &&
          companyName == other.companyName &&
          category == other.category &&
          frequency == other.frequency &&
          sinceYear == other.sinceYear &&
          totalEmails == other.totalEmails &&
          openRate == other.openRate &&
          securityScore == other.securityScore &&
          sensitivityScore == other.sensitivityScore &&
          hackingScore == other.hackingScore &&
          senderEmail == other.senderEmail &&
          strategy == other.strategy &&
          onUnsubscribe == other.onUnsubscribe &&
          onKeep == other.onKeep;

  @override
  int get hashCode =>
      logoUrl.hashCode ^
      companyName.hashCode ^
      category.hashCode ^
      frequency.hashCode ^
      sinceYear.hashCode ^
      totalEmails.hashCode ^
      openRate.hashCode ^
      securityScore.hashCode ^
      sensitivityScore.hashCode ^
      hackingScore.hashCode ^
      senderEmail.hashCode ^
      strategy.hashCode ^
      onUnsubscribe.hashCode ^
      onKeep.hashCode;
}
