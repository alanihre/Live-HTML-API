//
//  ViewController.h
//  Live HTML API
//
//  Created by Alan Ihre on 2012-08-15.
//  Copyright (c) 2012 Ihre IT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHAPI.h"

@interface ViewController : UIViewController<UIWebViewDelegate> {
    IBOutlet UIWebView *webView;
}

@property (nonatomic, retain) UIWebView *webView;

@end
