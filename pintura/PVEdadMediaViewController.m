//
//  PVEdadMediaViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVEdadMediaViewController.h"
#import "PV.h"
#import "PVImageView.h"

@interface PVEdadMediaViewController ()

@end



@implementation PVEdadMediaViewController

UIScrollView *page2Scroll, *page4Scroll;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //NSLog(@"Edad Media View Controller viewDidLoad");
    self.section = 2;
    
    // Title
    [self displayTitleOfPage:1 AtSection:1 InView:self.scrollview];
    
    // Content of page 1, Intro
    UIView *page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2
    UIView *page2 = [[UIView alloc] initWithFrame:self.p2Frame];
    CGRect frame2 = CGRectMake(50, 30, 650, 655);
    [self loadPageContentForPage:2 Section:2 AtFrame:frame2 OnView:page2 scrolls:YES];
    
    // Content of page 3
    UIView *page3 = [[UIView alloc] initWithFrame:self.p3Frame];
    CGRect frame3 = CGRectMake(100, 30, 650, 655);
    [self loadPageContentForPage:3 Section:2 AtFrame:frame3 OnView:page3 scrolls:YES];

    // Content of page 4
    page4Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(3*1024, 60, 1024, 655)];
    page4Scroll.contentSize = CGSizeMake(1024,2*768);
    page4Scroll.delegate = self;
    page4Scroll.showsVerticalScrollIndicator = NO;
    
    // First Paragraph
    CGRect frame41 = [self.layout regularBlock:150 vOffset:0];
    [self loadPageContentForPage:4 Section:self.section AtFrame:frame41 OnView:page4Scroll scrolls:NO];
    double page4Offset=frame41.size.height;
    
    // Avila
    double columnWidth=600;
    
    PVImageView *avila = [[PVImageView alloc]init];
    avila.name=@"avila.jpg";
    avila.legend=@"La ciudad amurallada de Avila";
    avila.legendEN=@"The walled city of Avila";
    avila.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];

    
    NSArray *page1pinturas = [NSArray arrayWithObjects:avila, nil];
    [self printColumFor:page1pinturas at:page4Scroll withWidth:columnWidth atX:150 Y:page4Offset];
    
    // Second Paragraph
    page4Offset=page4Offset+avila.frame.size.height+60;
    CGRect frame42 = [self.layout regularBlock:700 vOffset:page4Offset];
    [self loadPageContentForPage:5 Section:self.section AtFrame:frame42 OnView:page4Scroll scrolls:NO];
    page4Offset=page4Offset+frame42.size.height;

    
    PVImageView *cordoba = [[PVImageView alloc]init];
    cordoba.name=@"cordoba.jpg";
    cordoba.legend=@"Córdoba fue la capital del reino musulmán durante cientos de años";
    cordoba.legendEN=@"Cordoba was the capital city of the muslim empire during hundreds of years";
    cordoba.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    
    NSArray *page2pinturas = [NSArray arrayWithObjects:cordoba, nil];
    [self printColumFor:page2pinturas at:page4Scroll withWidth:columnWidth atX:150 Y:page4Offset];
    

    
    
    
    // Finalize configuration of scrollview
    [self.scrollview addSubview:page1];
    [self.scrollview addSubview:page2];
    [self.scrollview addSubview:page3]; 
    [self.scrollview addSubview:page4Scroll]; 
    
    self.scrollview.contentSize = CGSizeMake(4*1024, 768);
    self.scrollview.delegate = self;
    [self.view addSubview:self.scrollview];
    
    // Finalize configuration of pager
    self.pageControl.numberOfPages = 4;
    self.pageControl.delegate = self;
    [self.view addSubview:self.pageControl];
    [self drawTimeline:self.section onPage:page1];
    
}



- (void)handleImageSingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"image tap");
    PVImageView *image = (PVImageView*) recognizer.view;
    [self handleSimpleImageTap:recognizer onImage:image onPage:recognizer.view.superview];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Edad Media"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
