//
//  ViewController.m
//  Live HTML API
//
//  Created by Alan Ihre on 2012-08-15.
//  Copyright (c) 2012 Ihre IT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webView;

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://alanihre.se/apitest.html"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    LHUpdater *HTMLUpdater = [[LHUpdater alloc] initWithWebView:self.webView];
    
    [HTMLUpdater setTextContentForElement:@"#test .tjoho div" withContent:@"Hej Alan!"];
    NSString *LHResult = [HTMLUpdater getHTMLForElement:@"#test span .testKlass .tjoho"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"LHResult" message:LHResult delegate:self cancelButtonTitle:@"Stäng" otherButtonTitles:nil, nil];
    [alert show];

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
