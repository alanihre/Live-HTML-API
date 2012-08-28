//
//  LiveHTMLAPI.m
//  Live HTML API
//
//  Created by Alan Ihre on 2012-08-15.
//  Copyright (c) 2012 Ihre IT. All rights reserved.
//

#import "LHApi.h"

@implementation LHUpdater

- (id)initWithWebView:(UIWebView *)webView{
    self.webView = webView;
    return self;
}

- (void)LHDebugFunction:(NSString *)function withJavascriptToEvaluate:(NSString *)javascript{
    NSLog(@"LH Debug Message\nFunction: %@\n\nEvaluating JavaScript: %@\n\nEnd of LH Debug Message\n\n", function, javascript);
}


- (void)setTextContentForElement:(NSString *)elementString withContent:(NSString *)textContent{
    LHElement *element = [LHElement element:elementString];
    if (LH_DEBUG) {
        [self LHDebugFunction:@"setTextContentForElement:(NSString *)elementString withContent:(NSString *)textContent" withJavascriptToEvaluate:[NSString stringWithFormat:@"%@.textContent='%@';%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], textContent, [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
    }
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.textContent='%@';%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], textContent, [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
}

- (NSString *)getTextContentForElement:(NSString *)elementString{
    LHElement *element = [LHElement element:elementString];
    if (LH_DEBUG) {
        [self LHDebugFunction:@"getTextContentForElement:(NSString *)elementString" withJavascriptToEvaluate:[NSString stringWithFormat:@"%@.textContent;%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
    }
    return [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.textContent;%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
}

- (void)setHTMLForElement:(NSString *)elementString withHTML:(NSString *)HTML{
    LHElement *element = [LHElement element:elementString];
    if (LH_DEBUG) {
        [self LHDebugFunction:@"setHTMLForElement:(NSString *)elementString withHTML:(NSString *)textContent" withJavascriptToEvaluate:[NSString stringWithFormat:@"%@.innerHTML='%@';%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], HTML, [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
    }
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.innerHTML='%@';%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], HTML, [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
}

- (NSString *)getHTMLForElement:(NSString *)elementString{
    LHElement *element = [LHElement element:elementString];
    if (LH_DEBUG) {
        [self LHDebugFunction:@"getHTMLForElement:(NSString *)elementString" withJavascriptToEvaluate:[NSString stringWithFormat:@"%@.textContent;%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
    }
    return [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.innerHTML;%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
}

- (void)setAttributeForElement:(NSString *)elementString withAttributeName:(NSString *)attribute andAttributeValue:(NSString *)value{
    LHElement *element = [LHElement element:elementString];
    if (LH_DEBUG) {
        [self LHDebugFunction:@"setAttributeForElement:(NSString *)elementString withAttributeName:(NSString *)attribute andAttributeValue:(NSString *)value" withJavascriptToEvaluate:[NSString stringWithFormat:@"%@.setAttribute('%@','%@');%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], attribute, value, [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
    }
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.setAttribute('%@','%@');%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], attribute, value, [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
}


- (NSString *)getAttributeForElement:(NSString *)elementString withAttributeName:(NSString *)attribute{
    LHElement *element = [LHElement element:elementString];
    if (LH_DEBUG) {
        [self LHDebugFunction:@"getAttributeForElement:(NSString *)elementString withAttributeName:(NSString *)attribute" withJavascriptToEvaluate:[NSString stringWithFormat:@"%@.getAttribute('%@');%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], attribute, [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
    }
    return [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.getAttribute('%@');%@",[element.elementPath substringToIndex:element.elementPath.length-element.indentationLevel], attribute, [element.elementPath substringFromIndex:element.elementPath.length-element.indentationLevel]]];
}









//Old code

#pragma mark Remove Elements

- (void)removeElementWithId:(NSString *)elementID{
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('%@').parentNode.removeChild(document.getElementById('%@'));", elementID, elementID]];
    NSLog(@"Removed element with ID: %@", elementID);
}

- (void)removeElementsWithTagName:(NSString *)tagName{
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"var elems=document.getElementsByTagName('%@');for (i=0; i<elems.length; i++){elems[i].parentNode.removeChild(elems[i]);}", tagName]];
    NSLog(@"Removed elements with name: %@", tagName);
}

- (void)removeElementsWithClass:(NSString *)className{
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"var elems=document.getElementsByClassName('%@');for (i=0; i<elems.length; i++){elems[i].parentNode.removeChild(elems[i]);}", className]];
    NSLog(@"Removed elements with class: %@", className);
}

#pragma mark Add Elements


#pragma mark - Text Content
#pragma mark Get Text Content
- (NSString *)getTextContentForElementWithId:(NSString *)elementID{
    return [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('%@').textContent;", elementID]];
}

- (NSArray *)getTextContentForElementsWithTagName:(NSString *)tagName{
    NSMutableArray *arrayOfTextContent = [[NSMutableArray alloc] init];
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@').length;", tagName]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [arrayOfTextContent addObject:[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@')[%d].textContent;", tagName,i]]];
    }
    return [NSArray arrayWithArray:arrayOfTextContent];
}

- (NSArray *)getTextContentForElementsWithClass:(NSString *)className{
    NSMutableArray *arrayOfTextContent = [[NSMutableArray alloc] init];
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@').length;", className]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [arrayOfTextContent addObject:[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@')[%d].textContent;", className,i]]];
    }
    return [NSArray arrayWithArray:arrayOfTextContent];
}


#pragma mark - HTML Content
#pragma mark Get HTML Content
- (NSString *)getHTMLContentForElementWithId:(NSString *)elementID{
    return [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('%@').innerHTML;", elementID]];
}

- (NSArray *)getHTMLContentForElementsWithTagName:(NSString *)tagName{
    NSMutableArray *arrayOfTextContent = [[NSMutableArray alloc] init];
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@').length;", tagName]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [arrayOfTextContent addObject:[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@')[%d].innerHTML;", tagName,i]]];
    }
    return [NSArray arrayWithArray:arrayOfTextContent];
}

- (NSArray *)getHTMLContentForElementsWithClass:(NSString *)className{
    NSMutableArray *arrayOfTextContent = [[NSMutableArray alloc] init];
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@').length;", className]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [arrayOfTextContent addObject:[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@')[%d].innerHTML;", className,i]]];
    }
    return [NSArray arrayWithArray:arrayOfTextContent];
}


#pragma mark - Attributes
#pragma mark Get Attributes

- (NSString *)getAttributeValueForElementWithId:(NSString *)elementID attributeName:(NSString *)attribute{
    return [self.self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('%@').getAttribute('%@');", elementID, attribute]];

}
- (NSArray *)getAttributeValueForElementsWithTagName:(NSString *)tagName attributeName:(NSString *)attribute{
    NSMutableArray *arrayOfTextContent = [[NSMutableArray alloc] init];
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@').length;", tagName]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [arrayOfTextContent addObject:[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@')[%d].getAttribute('%@');", tagName, i, attribute]]];
    }
    return [NSArray arrayWithArray:arrayOfTextContent];
}
- (NSArray *)getAttributeValueForElementsWithClass:(NSString *)className attributeName:(NSString *)attribute{
    NSMutableArray *arrayOfTextContent = [[NSMutableArray alloc] init];
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@').length;", className]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [arrayOfTextContent addObject:[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@')[%d].getAttribute('%@');", className, i, attribute]]];
    }
    return [NSArray arrayWithArray:arrayOfTextContent];
}

#pragma mark Set Attributes

- (void)setAttributeValueForElementWithId:(NSString *)elementID attributeName:(NSString *)attribute attributeValue:(NSString *)value{
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('%@').setAttribute('%@','%@');", elementID, attribute, value]];
    
}
- (void)setAttributeValueForElementsWithTagName:(NSString *)tagName attributeName:(NSString *)attribute attributeValue:(NSString *)value{
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@').length;", tagName]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@')[%d].setAttribute('%@','%@');", tagName, i, attribute, value]];
    }
}
- (void)setAttributeValueForElementsWithClass:(NSString *)className attributeName:(NSString *)attribute attributeValue:(NSString *)value{
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@').length;", className]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@')[%d].setAttribute('%@','%@');", className, i, attribute, value]];
    }
}

#pragma mark Remove Attributes
- (void)removeAttributeValueForElementWithId:(NSString *)elementID attributeName:(NSString *)attribute{
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('%@').removeAttribute('%@');", elementID, attribute]];
}
- (void)removeAttributeValueForElementsWithTagName:(NSString *)tagName attributeName:(NSString *)attribute{
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@').length;", tagName]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByTagName('%@')[%d].removeAttribute('%@');", tagName, i, attribute]];
    }

}
- (void)removeAttributeValueForElementsWithClass:(NSString *)className attributeName:(NSString *)attribute{
    int numberOfElements = [[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@').length;", className]] intValue];
    for (int i=0; i<numberOfElements; i++) {
        [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('%@')[%d].removeAttribute('%@');", className, i, attribute]];
    }
}

@end
