#import "SpamCardsPlugin.h"
#if __has_include(<spam_cards/spam_cards-Swift.h>)
#import <spam_cards/spam_cards-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "spam_cards-Swift.h"
#endif

@implementation SpamCardsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSpamCardsPlugin registerWithRegistrar:registrar];
}
@end
