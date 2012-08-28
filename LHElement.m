//
//  LHElement
//  Live HTML API
//
//  Created by Alan Ihre on 2012-08-16.
//  Copyright (c) 2012 Ihre IT. All rights reserved.
//

#import "LHElement.h"

@implementation LHElement
@synthesize elementPath, indentationLevel;

- (id)initWithElement:(NSString *)element{
    NSArray *arguments = [element componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    int i = 0;
    indentationLevel = 0;
    BOOL tempvarAlreadySet = NO;
    NSString *elementPathJSString = @"document";
    while (i<arguments.count) {
        if ([[[arguments objectAtIndex:i] substringToIndex:1] isEqualToString:@"#"]) {
            if (indentationLevel != 0 && tempvarAlreadySet == NO) {
                tempvarAlreadySet = YES;
                elementPathJSString = [elementPathJSString stringByAppendingString:[NSString stringWithFormat:@"tempvar%d[i%d].getElementById('%@')",indentationLevel-1, indentationLevel-1, [[arguments objectAtIndex:i] substringFromIndex:1]]];
            }else{
                elementPathJSString = [elementPathJSString stringByAppendingString:[NSString stringWithFormat:@".getElementById('%@')", [[arguments objectAtIndex:i] substringFromIndex:1]]];
            }
        }else if ([[[arguments objectAtIndex:i] substringToIndex:1] isEqualToString:@"."]) {
            if (indentationLevel != 0) {
                elementPathJSString = [elementPathJSString stringByAppendingString:[NSString stringWithFormat:@"var tempvar%d=tempvar%d[i%d].getElementsByClassName('%@');for(i%d=0;i%d<tempvar%d.length;i%d++){",indentationLevel , indentationLevel-1, indentationLevel-1, [[arguments objectAtIndex:i] substringFromIndex:1], indentationLevel, indentationLevel, indentationLevel, indentationLevel]];

            }else{
                elementPathJSString = [NSString stringWithFormat:@"var tempvar%d=%@.getElementsByClassName('%@');for(i0=0;i0<tempvar%d.length;i0++){",indentationLevel , elementPathJSString, [[arguments objectAtIndex:i] substringFromIndex:1], indentationLevel];
            }
            tempvarAlreadySet = NO;
            indentationLevel++;
        }else{
            if (indentationLevel != 0) {
                elementPathJSString = [elementPathJSString stringByAppendingString:[NSString stringWithFormat:@"var tempvar%d=tempvar%d[i%d].getElementsByTagName('%@');for(i%d=0;i%d<tempvar%d.length;i%d++){",indentationLevel , indentationLevel-1, indentationLevel-1, [arguments objectAtIndex:i], indentationLevel, indentationLevel, indentationLevel, indentationLevel]];
            }else{
                elementPathJSString = [NSString stringWithFormat:@"var tempvar%d=%@.getElementsByTagName('%@');for(i0=0;i0<tempvar%d.length;i0++){",indentationLevel , elementPathJSString, [arguments objectAtIndex:i], indentationLevel];
            }
            tempvarAlreadySet = NO;
            indentationLevel++;
        }
        i++;
    }
    if (indentationLevel != 0) {
        elementPathJSString = [elementPathJSString stringByAppendingString:[NSString stringWithFormat:@"tempvar%d[i%d]",indentationLevel-1, indentationLevel-1]];
    }
    for (int indetionIndex=0; indetionIndex<indentationLevel; indetionIndex++) {
        elementPathJSString = [elementPathJSString stringByAppendingString:@"}"];
    }
    elementPath = elementPathJSString;
    return self;
}

+ (id)element:(NSString *)element{
    return [[self alloc] initWithElement:element];
}
@end
