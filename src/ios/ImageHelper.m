#import "ImageHelper.h"

@implementation ImageHelper
- (void)saveToUserLibrary:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* result = nil;
    NSString* argPath = [command.arguments objectAtIndex:0];
    UIImage *img = nil;

    if ([argPath hasPrefix:@"http"] || [argPath hasPrefix:@"file"]) {
        NSURL *url = [NSURL URLWithString:argPath];
        NSData *data = [NSData dataWithContentsOfURL:url];
        img = [[UIImage alloc] initWithData:data];
    }
    else
    {
        NSString* path = [ [ [ NSBundle mainBundle ] bundlePath ] stringByAppendingString:argPath ];
        img = [[UIImage alloc] initWithContentsOfFile:argPath];
    }

    if (img != nil) {
        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:argPath];
    }
    else
    {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Error when saving image"];
    }

    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
@end
