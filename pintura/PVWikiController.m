//
//  PVWikiController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVWikiController.h"

@interface PVWikiController ()

@property (weak, nonatomic) IBOutlet UIWebView *wikiWeb;
@end

@implementation PVWikiController
@synthesize wikiWeb;
@synthesize url;

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
	// Do any additional setup after loading the view.
    //NSLog(@"Wiki controller: %@", self.url);
    
    
    NSURL *urlLink = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlLink];
    [self.wikiWeb loadRequest:request];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //NSLog(@"Wiki controller: %@", self.url);
    
    
    NSURL *urlLink = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlLink];
    [self.wikiWeb loadRequest:request];
    
}


- (void)viewDidUnload
{
    [self setWikiWeb:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Wikipedia"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
