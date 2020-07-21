#import "TockFlutterKitPlugin.h"
#if __has_include(<tock_flutter_kit/tock_flutter_kit-Swift.h>)
#import <tock_flutter_kit/tock_flutter_kit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "tock_flutter_kit-Swift.h"
#endif

@implementation TockFlutterKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTockFlutterKitPlugin registerWithRegistrar:registrar];
}
@end
