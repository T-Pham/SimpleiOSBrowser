//
//  TPMViewController.m
//  TestUIWebView
//
//  Created by East Agile on 10/2/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import "TPMViewController.h"

@interface TPMViewController ()

@end

@implementation TPMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *googlePath = @"http://google.com";
    [webAddress setText:googlePath];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:googlePath]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self loadWeb];
    [textField resignFirstResponder];
    return YES;
}

- (void)loadWeb
{
    NSMutableString *webAddressText = [[NSMutableString alloc] initWithString:[webAddress text]];
    if ([webAddressText rangeOfString:@"http://"].location == NSNotFound) [webAddressText insertString:@"http://" atIndex:0];
    [webAddress setText:webAddressText];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webAddressText]]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [webView loadHTMLString:[error localizedDescription] baseURL:nil];
    [activityIndicator stopAnimating];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [activityIndicator stopAnimating];
}

- (void)webBack
{
    [webView goBack];
}

- (void)webForward
{
    [webView goForward];
}

@end
