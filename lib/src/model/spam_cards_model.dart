class SpamCardsModel {
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
  String provider;
  Function? onUnsubscribe;
  Function? onKeep;

  SpamCardsModel(
      {required this.provider,
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
      other is SpamCardsModel &&
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
          senderEmail == other.senderEmail;

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
      senderEmail.hashCode;

  SpamCardsModel.fromMessageList(
      {required List messages,
      required String calculatedFrequency,
      required double calculatedOpenRate,
      required this.provider,
      this.onKeep,
      this.onUnsubscribe})
      : logoUrl = messages[0].sender?.company?.logo,
        category = messages[0].sender?.category,
        companyName = messages[0].sender?.name,
        frequency = calculatedFrequency,
        openRate = calculatedOpenRate,
        securityScore = messages[0].sender?.company?.securityScore,
        sensitivityScore = messages[0].sender?.company?.sensitivityScore,
        hackingScore = messages[0].sender?.company?.breachScore,
        senderEmail = messages[0].sender?.email,
        totalEmails = messages.length,
        sinceYear = messages[0].sender?.emailSince?.year.toString();
}

enum SpamCardsFrequency { daily, weekly, monthly }
