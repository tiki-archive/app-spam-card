import 'package:decision_sdk/decision.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:spam_cards/src/spam_cards_style.dart';

import 'spam_cards_model.dart';
import 'ui/decision_spam_layout.dart';

class SpamCardsService extends ChangeNotifier {
  final _log = Logger('SpamCardsService');
  final DecisionSdk decisionSdk;
  final SpamCardsStyle style;

  SpamCardsService({required this.decisionSdk, required this.style});

  Future<void> addCards(
      {required String provider,
      required List<dynamic> messages,
      required String email,
      required String token}) async {
    List<SpamCardsModel> spamModels = [];
    String calculatedFrequency = _calculateFrequency(messages);
    double calculatedOpenRate = _calculateOpenRate(messages);
    spamModels.add(SpamCardsModel.fromMessageList(
        messages: messages,
        calculatedFrequency: calculatedFrequency,
        calculatedOpenRate: calculatedOpenRate,
        dataProvider: provider,
        token: token));
    decisionSdk.addCards(spamModels
        .map((spamModel) => SpamCardsLayout(this, spamModel))
        .toList());
  }

  Future<bool> unsubscribe(ApiOAuthModelAccount account,
      String unsubscribeMailTo, String list) async {
    DataFetchInterfaceEmail? interfaceEmail = await _getEmailInterface(account);
    if (interfaceEmail == null) throw 'Invalid email interface';
    if (!await _isConnected(account)) {
      throw 'ApiOauthAccount ${account.provider} not connected.';
    }

    Uri uri = Uri.parse(unsubscribeMailTo);
    String to = uri.path;
    String subject = uri.queryParameters['subject'] ?? "Unsubscribe from $list";
    String body = '''
Hello,<br /><br />
I'd like to stop receiving emails from this email list.<br /><br />
Thanks,<br /><br />
${account.displayName ?? ''}<br />
<br />
''';
    bool success = false;
    await interfaceEmail.send(
        account: account,
        to: to,
        body: body,
        subject: subject,
        onResult: (res) => success = res);
    return success;
  }

  Future<void> unsubscribeCallback(int senderId) async {
    var sender = await decisionSdk.apiEmailSenderService.getById(senderId);
    if (sender != null) {
      try {
        var account = (await decisionSdk.apiAuthService.getAccount())!;
        String? mailTo = sender.unsubscribeMailTo;
        if (mailTo != null) {
          String list = sender.name ?? sender.email!;
          decisionSdk.dataFetchService.email
              .unsubscribe(account, mailTo, list)
              .then((success) => _log.finest(
                  mailTo + ' unsubscribed status: ' + success.toString()));
          await decisionSdk.apiEmailSenderService.markAsUnsubscribed(sender);
        }
      } catch (e) {
        _log.warning(
            'Failed to unsubscribe from: ' + sender.unsubscribeMailTo!, e);
      }
    }
  }

  Future<void> keepCallback(int senderId) async {
    var sender = await decisionSdk.apiEmailSenderService.getById(senderId);
    if (sender != null) {
      await decisionSdk.apiEmailSenderService.markAsKept(sender);
    }
  }

  String _calculateFrequency(List<dynamic> messages) {
    const int secsInDay = 86400;
    const int secsInWeek = 604800;
    const int secsInMonth = 2629746;

    if (messages.length == 1) return "once";

    messages.sort((a, b) => a.receivedDate!.isBefore(b.receivedDate!) ? -1 : 1);
    List<Duration> freq = [];
    for (int i = 0; i < messages.length - 1; i++) {
      freq.add(
          messages[i].receivedDate!.difference(messages[i + 1].receivedDate!));
    }
    double avgSeconds = 0;
    freq.map((f) => f.inSeconds).forEach((f) => avgSeconds += f);
    avgSeconds = (avgSeconds / freq.length).abs();

    if (avgSeconds <= secsInDay) {
      return "daily";
    } else if (avgSeconds <= secsInWeek) {
      return "weekly";
    } else if (avgSeconds <= secsInMonth) {
      return "monthly";
    } else if (avgSeconds <= secsInMonth * 3) {
      return "quarterly";
    } else if (avgSeconds <= secsInMonth * 6) {
      return "semiannually";
    } else {
      return "annually";
    }
  }

  double _calculateOpenRate(List<dynamic> messages) {
    int opened = 0;
    int total = messages.length;
    for (var message in messages) {
      if (message.openedDate != null) opened++;
    }
    return opened / total;
  }
}
