//
//  PVLicenseController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVLicenseController.h"
#import "PV.h"

@interface PVLicenseController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation PVLicenseController
@synthesize webView;
@synthesize mode;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //NSLog(@"License: %@", self.mode);
    //NSLog(@"by content: %@", [[NSBundle mainBundle] pathForResource: @"sources" ofType: @"txt"]);
    if ([self.mode isEqualToString:@"license"]){
        //NSLog(@"License");
        
        NSURL *url;
        if ([[[PV sharedInstance] language] isEqual:@"ES"]) url = [NSURL URLWithString:@"http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES"];
        else url = [NSURL URLWithString:@"http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_EN"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
    if ([self.mode isEqualToString:@"by"]){
        NSString* htmlString;
        if ([[[PV sharedInstance] language] isEqual:@"ES"]) htmlString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"sourcesES" ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
        else htmlString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"sourcesEN" ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
        //NSLog(@"File: %@", htmlString);
        [self.webView loadHTMLString:htmlString baseURL:nil];
        
    }
    
    
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
@end
