class SpamCardsModel {
  String? logoUrl;
  String? companyName;
  String? category;
  String? frequency;
  String? sinceYear;
  String provider;
  String token;
  String? refreshToken;
  int? totalEmails;
  double? openRate;
  double? securityScore;
  double? sensitivityScore;
  double? hackingScore;
  String? senderEmail;
  late int senderId;

  SpamCardsModel({
    this.logoUrl,
    this.category,
    required this.companyName,
    required this.frequency,
    required this.provider,
    this.sinceYear,
    this.totalEmails,
    required this.openRate,
    this.securityScore,
    this.sensitivityScore,
    this.hackingScore,
    this.senderEmail,
    required this.senderId,
    required this.token,
    this.refreshToken
  });

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
          senderEmail == other.senderEmail &&
          senderId == other.senderId;

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
      senderId.hashCode;

  SpamCardsModel.fromMessageList({
    required List messages,
    required String dataProvider,
    required String token,
    String? refreshToken,
    required String calculatedFrequency,
    required double calculatedOpenRate,
  })  : logoUrl = messages[0].sender?.company?.logo,
        category = messages[0].sender?.category,
        companyName = messages[0].sender?.name,
        frequency = calculatedFrequency,
        openRate = calculatedOpenRate,
        securityScore = messages[0].sender?.company?.securityScore,
        sensitivityScore = messages[0].sender?.company?.sensitivityScore,
        hackingScore = messages[0].sender?.company?.breachScore,
        senderId = messages[0].sender.senderId,
        senderEmail = messages[0].sender?.email,
        totalEmails = messages.length,
        sinceYear = messages[0].sender?.emailSince?.year.toString(),
        provider = dataProvider,
        token = token,
        refreshToken = refreshToken;
}

enum SpamCardsFrequency { daily, weekly, monthly }
