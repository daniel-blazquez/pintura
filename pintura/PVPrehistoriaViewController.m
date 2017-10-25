//
//  PVPrehistoriaViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVPrehistoriaViewController.h"
#import "PV.h"
#import "PVImageView.h"


@interface PVPrehistoriaViewController ()
@end

@implementation PVPrehistoriaViewController

PVImageView *altamira, *altamiraBison, *cogul, *toro;
UIView *page1;
UIScrollView *page2Scroll, *page3Scroll;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //NSLog(@"Prehistoria View Controller viewDidLoad");
    self.section = 1;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1, Intro
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    [self.scrollview addSubview:page1];
    
    // Content of page 2, Pintura Rupestre
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 655)];
    page2Scroll.contentSize = CGSizeMake(1024,1.5*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    double columnWidth = 320;
    
    CGRect frame2 = CGRectMake(60, 0, 1024-120-columnWidth, 800);
    [self loadPageContentForPage:2 Section:1 AtFrame:frame2 OnView:page2Scroll scrolls:YES];
    
    PVImageView *altamira = [[PVImageView alloc]init];
    altamira.name=@"altamira.jpg";
    altamira.legend=@"Réplica del techo de la cueva de Altamira";
    altamira.legendEN=@"A replica of ceiling of the Cave of Altamira";
    altamira.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    altamira.link = @"http://es.m.wikipedia.org/wiki/Cueva_de_Altamira";
    altamira.linkEN = @"http://en.m.wikipedia.org/wiki/Cave_of_Altamira";
    
    PVImageView *altamiraBison = [[PVImageView alloc]init];
    altamiraBison.name=@"AltamiraBison.jpg";
    altamiraBison.legend=@"Un bien definido y colorido bison en Altamira";
    altamiraBison.legendEN=@"A well-defined and colorful bison in the Cave of Altamirae";
    altamiraBison.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page2pinturas = [NSArray arrayWithObjects:altamira,altamiraBison, nil];
    [self printColumFor:page2pinturas at:page2Scroll withWidth:columnWidth atX:1024-30-columnWidth Y:60];
    
    
    // Content of page 3, Pintura rupestre levantina
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame3 = [self.layout rightBlock:600 offset:60 leftOffset:columnWidth];
    [self loadPageContentForPage:3 Section:1 AtFrame:frame3 OnView:page3Scroll scrolls:NO];
    
    // Column of images
    PVImageView *cogul = [[PVImageView alloc]init];
    cogul.name=@"Cogul.jpeg";
    cogul.legend=@"Danza de Cogul, en la Roca De Los Moros";
    cogul.legendEN=@"The Dance of Cogul, at Roca dels Moros";
    cogul.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    cogul.link = @"http://es.m.wikipedia.org/wiki/Roca_de_los_Moros";
    cogul.linkEN = @"http://en.m.wikipedia.org/wiki/Roca_de_los_Moros";
    
    PVImageView *toro = [[PVImageView alloc]init];
    toro.name=@"toro.jpeg";
    toro.legend=@"Toro en el yacimiento de Selva Pascuala - Villar del Humo";
    toro.legendEN=@"Bull in Selva Pascuala site, at the Villar del Humo village";
    toro.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
   
    NSArray *page3pinturas = [NSArray arrayWithObjects:cogul,toro, nil];
    [self printColumFor:page3pinturas at:page3Scroll withWidth:columnWidth atX:60 Y:60];
    
    
    // Finalize configuration of scrollview
    [self.scrollview addSubview:page2Scroll];
    [self.scrollview addSubview:page3Scroll];
    self.scrollview.contentSize = CGSizeMake(3*1024, 768);
    self.scrollview.delegate = self;
    [self.view addSubview:self.scrollview];
    
    // Finalize configuration of pager
    self.pageControl.numberOfPages = 3;
    self.pageControl.delegate = self;
    [self.view addSubview:super.pageControl];
    [self drawTimeline:self.section onPage:page1];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    [super scrollViewDidScroll:sender];
}


- (void)handleImageSingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"image tap");
    PVImageView *image = (PVImageView*) recognizer.view;
    [self handleSimpleImageTap:recognizer onImage:image onPage:recognizer.view.superview];
}


- (void)handleInteractiveSingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"interactive tap");
    PVImageView *image = (PVImageView*) recognizer.view;
    self.imageSegue = image.name;
    self.imageSegueTitle = image.legend;
    [self performSegueWithIdentifier:@"interactive" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"tracking: prehistoria");
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Prehistoria"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
