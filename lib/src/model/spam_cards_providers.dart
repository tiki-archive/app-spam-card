import 'package:google_provider/google_provider.dart';
import 'package:microsoft_provider/microsoft_provider.dart';

enum SpamCardsProviders { google, microsoft }

extension SpamCardsProvidersClass on SpamCardsProviders {
  get className {
    switch (this) {
      case SpamCardsProviders.google:
        return GoogleProvider;
      case SpamCardsProviders.microsoft:
        return MicrosoftProvider;
    }
  }
}
