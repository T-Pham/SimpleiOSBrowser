//
//  TPMViewController.h
//  TestUIWebView
//
//  Created by East Agile on 10/2/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPMViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>
{
    IBOutlet UITextField *webAddress;
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
}

- (IBAction) webBack;
- (IBAction) webForward;
- (void)loadWeb;

@end
