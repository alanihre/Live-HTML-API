//
//  LiveHTMLAPI.h
//  Live HTML API
//
//  Created by Alan Ihre on 2012-08-15.
//  Copyright (c) 2012 Ihre IT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHElement.h"

#define LH_DEBUG				YES

@interface LHUpdater : NSObject

- (id)initWithWebView:(UIWebView *)webView;
    
@property (nonatomic, assign) UIWebView *webView;


- (void)setTextContentForElement:(NSString *)elementString withContent:(NSString *)textContent;
- (NSString *)getTextContentForElement:(NSString *)elementString;

- (void)setHTMLForElement:(NSString *)elementString withHTML:(NSString *)HTML;
- (NSString *)getHTMLForElement:(NSString *)elementString;

- (void)setAttributeForElement:(NSString *)elementString withAttributeName:(NSString *)attribute andAttributeValue:(NSString *)value;
- (NSString *)getAttributeForElement:(NSString *)elementString withAttributeName:(NSString *)attribute;

    


//old code

#pragma mark - Traversing
#pragma mark Get Elements

#pragma mark Remove Elements
- (void)removeElementWithId:(NSString *)elementID;
- (void)removeElementsWithTagName:(NSString *)tagName;
- (void)removeElementsWithClass:(NSString *)className;
#pragma mark - Text Content
#pragma mark Get Text Content
- (NSString *)getTextContentForElementWithId:(NSString *)elementID;
- (NSArray *)getTextContentForElementsWithTagName:(NSString *)tagName;
- (NSArray *)getTextContentForElementsWithClass:(NSString *)className;

#pragma mark - HTML Content
#pragma mark Get HTML Content
- (NSString *)getHTMLContentForElementWithId:(NSString *)elementID;
- (NSArray *)getHTMLContentForElementsWithTagName:(NSString *)tagName;
- (NSArray *)getHTMLContentForElementsWithClass:(NSString *)className;

#pragma mark - Attributes
#pragma mark Get Attributes
- (NSString *)getAttributeValueForElementWithId:(NSString *)elementID attributeName:(NSString *)attribute;
- (NSArray *)getAttributeValueForElementsWithTagName:(NSString *)tagName attributeName:(NSString *)attribute;
- (NSArray *)getAttributeValueForElementsWithClass:(NSString *)className attributeName:(NSString *)attribute;

#pragma mark Set Attributes
- (void)setAttributeValueForElementWithId:(NSString *)elementID attributeName:(NSString *)attribute attributeValue:(NSString *)value;
- (void)setAttributeValueForElementsWithTagName:(NSString *)tagName attributeName:(NSString *)attribute attributeValue:(NSString *)value;
- (void)setAttributeValueForElementsWithClass:(NSString *)className attributeName:(NSString *)attribute attributeValue:(NSString *)value;

#pragma mark Remove Attributes
- (void)removeAttributeValueForElementWithId:(NSString *)elementID attributeName:(NSString *)attribute;
- (void)removeAttributeValueForElementsWithTagName:(NSString *)tagName attributeName:(NSString *)attribute;
- (void)removeAttributeValueForElementsWithClass:(NSString *)className attributeName:(NSString *)attribute;

@end
