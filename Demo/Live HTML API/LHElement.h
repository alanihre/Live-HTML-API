//
//  LiveHTMLElement.h
//  Live HTML API
//
//  Created by Alan Ihre on 2012-08-16.
//  Copyright (c) 2012 Ihre IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHElement : NSObject

@property (nonatomic, retain) NSString *elementPath;
@property (nonatomic) int indentationLevel;

- (id)initWithElement:(NSString *)element;
+ (id)element:(NSString *)element;

@end
