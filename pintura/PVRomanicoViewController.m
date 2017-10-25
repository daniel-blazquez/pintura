//
//  PVRomanicoViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVRomanicoViewController.h"
#import "PVImageView.h"

@interface PVRomanicoViewController ()

@end

@implementation PVRomanicoViewController

PVImageView *tahull, *mariae, *cogul, *isidoro, *bestiario, *baudelio;
UIView *page1,*page2, *page3;
UIScrollView *page2Scroll, *page3Scroll;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSLog(@"Romanico View Controller viewDidLoad");
    self.section = 3;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1, Intro
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 1200)];
    page2Scroll.contentSize = CGSizeMake(1024,2.5*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame2 = CGRectMake(50, 0, 570, 1200);
    [self loadPageContentForPage:2 Section:3 AtFrame:frame2 OnView:page2Scroll scrolls:NO];
    
    
    PVImageView *tahull = [[PVImageView alloc]init];
    tahull.name=@"tahull.jpeg";
    tahull.legend=@"\"Maiestas Dómini”, fresco, San Clemente de Tahul (Lérida)";
    tahull.legendEN=@"\"Maiestas Dómini”, fresco, San Clemente de Tahul (Lérida)";
    tahull.bottomPadding = 150;
    tahull.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    
    PVImageView *mar = [[PVImageView alloc]init];
    mar.name=@"mariae.jpg";
    mar.legend=@"Maiestas Mariae";
    mar.legendEN=@"Maiestas Mariae";
    mar.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];

    NSArray *page2pinturas = [NSArray arrayWithObjects:tahull, mar, nil];
    [self printColumFor:page2pinturas at:page2Scroll withWidth:300 atX:660 Y:100];
    
    
    
    // Content of page 3
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,1.7*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame3 = CGRectMake(50, 60+230, 900, 600);
    [self loadPageContentForPage:3 Section:3 AtFrame:frame3 OnView:page3Scroll scrolls:NO];
    [page3Scroll addSubview:page3];  
    
    CGRect frame31 = CGRectMake(50, 980, 900, 400);
    [self loadPageContentForPage:4 Section:3 AtFrame:frame31 OnView:page3Scroll scrolls:NO];
    [page3Scroll addSubview:page3];     

    PVImageView *isidoro = [[PVImageView alloc]init];
    isidoro.name=@"isidoro.jpg";
    isidoro.legend=@"Basilica of San Isidoro, general view of the The Royal Pantheon, XII century)";
    isidoro.legendEN=@"Maiestas Mariae";
    isidoro.link=@"http://es.m.wikipedia.org/wiki/Pante%C3%B3n_de_los_Reyes_de_Le%C3%B3n";
    isidoro.linkEN=@"http://en.m.wikipedia.org/wiki/Basilica_of_San_Isidoro";
    isidoro.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    PVImageView *bestiario = [[PVImageView alloc]init];
    bestiario.name=@"bestiario.jpg";
    bestiario.legend=@"\"Anunciación a los pastores”, Pintura mural en el Panteón Real de la Colegiata de San Isidoro de León, Siglo XII)";
    bestiario.legendEN=@"\"Annunciation\",mural painting in the The Royal Pantheon, Basilica of San Isidoro, XII century";
    bestiario.link=@"http://es.m.wikipedia.org/wiki/Pante%C3%B3n_de_los_Reyes_de_Le%C3%B3n";
    bestiario.linkEN=@"http://en.m.wikipedia.org/wiki/Basilica_of_San_Isidoro";
    bestiario.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    
    NSArray *page3pinturas = [NSArray arrayWithObjects:isidoro, bestiario, nil];
    [self printRowFor:page3pinturas at:page3Scroll withHeight:250 atX:60 Y:0];
    
    
    PVImageView *baudelio = [[PVImageView alloc]init];
    baudelio.name=@"baudelio.jpg";
    baudelio.legend=@"Pintura mural en la ermita de San Baudelio, siglo XI";
    baudelio.legendEN=@"San Baudelio mual painting, XI century";
    baudelio.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    
    NSArray *page4pinturas = [NSArray arrayWithObjects:baudelio, nil];
    [self printRowFor:page4pinturas at:page3Scroll withHeight:250 atX:300 Y:680];
    
    
    // Finalize configuration of scrollview
    [self.scrollview addSubview:page1];
    [self.scrollview addSubview:page2Scroll];
    [self.scrollview addSubview:page3Scroll];
    
    self.scrollview.contentSize = CGSizeMake(3*1024, 768);
    self.scrollview.delegate = self;
    [self.view addSubview:self.scrollview];
    
    // Finalize configuration of pager
    self.pageControl.numberOfPages = 3;
    self.pageControl.delegate = self;
    [self.view addSubview:self.pageControl];
    [self drawTimeline:self.section onPage:page1];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    [super scrollViewDidScroll:sender];
}

- (void)handleInteractiveSingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"interactive tap");
    PVImageView *image = (PVImageView*) recognizer.view;
    self.imageSegue = image.name;
    self.imageSegueTitle = image.legend;
    [self performSegueWithIdentifier:@"interactive" sender:self];
}


- (void)handleImageSingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"image tap");
    PVImageView *image = (PVImageView*) recognizer.view;
    [self handleSimpleImageTap:recognizer onImage:image onPage:recognizer.view.superview];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];  
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Romanico"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
