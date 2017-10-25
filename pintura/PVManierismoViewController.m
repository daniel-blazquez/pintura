//
//  PVManierismoViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVManierismoViewController.h"

@interface PVManierismoViewController ()

@end

@implementation PVManierismoViewController

PVImageView *caballero, *entierro, *autodefe, *dot1IM, *dot2IM,*dot3IM, *dot4IM, *purificacion, *lactante, *infanta, *suegra;
UIView *page1,*page2, *page3, *page4;
UIScrollView *page2Scroll, *page3Scroll, *page4Scroll;

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"Manierismo View Controller viewDidLoad");
    self.section = 6;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1, Intro
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 655)];
    page2Scroll.contentSize = CGSizeMake(1024,2.5*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame2 = CGRectMake(60, 0, 860, 280);
    [self loadPageContentForPage:2 Section:self.section AtFrame:frame2 OnView:page2Scroll scrolls:NO];
    
    CGRect frame21 = CGRectMake(400, 280, 530, 580);
    [self loadPageContentForPage:3 Section:self.section AtFrame:frame21 OnView:page2Scroll scrolls:NO];
    
    CGRect frame22 = CGRectMake(60, 740, 530, 1000);
    [self loadPageContentForPage:4 Section:self.section AtFrame:frame22 OnView:page2Scroll scrolls:NO];
    
    // Content of page 3
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,1.5*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame3 = CGRectMake(490, 0, 490, 1200);
    [self loadPageContentForPage:5 Section:self.section  AtFrame:frame3 OnView:page3Scroll scrolls:NO];
    
    
    // Retablo (especial)
    UIImageView *santodomingo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"santodomingo.jpg"]];
    santodomingo.frame = CGRectMake(60, 0, 400, 741);
    [page3Scroll addSubview:santodomingo];
    
    // Trinidad
    UIImageView *dot1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"circleicon.png"]];
    dot1.frame = CGRectMake(60+200, 290, 30, 30);
    dot1IM = [[PVImageView alloc] initWithImage:[UIImage imageNamed:@"santodomingotrinidad.jpg"]];
    dot1IM.frame = CGRectMake(60+200+15, 290+15, 1, 1);
    dot1IM.legend=@"La Trinidad";
    dot1IM.legendEN=@"The Trinity";
    dot1IM.originalImage = dot1IM.image;
    [page3Scroll addSubview:dot1IM];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDot1SingleTap:)];
    UITapGestureRecognizer *tap1IM = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [dot1 addGestureRecognizer:tap1];[dot1IM addGestureRecognizer:tap1IM];
    [dot1 setUserInteractionEnabled:YES];[dot1IM setUserInteractionEnabled:YES];
    [page3Scroll addSubview:dot1];
    
    // La Trinidad
    UIImageView *dot2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"circleicon.png"]];
    dot2.frame = CGRectMake(60+200, 415, 30, 30);
    dot2IM = [[PVImageView alloc] initWithImage:[UIImage imageNamed:@"santodomingoasuncion.jpg"]];
    dot2IM.frame = CGRectMake(60+200+15, 415+15, 1, 1);
    dot2IM.legend=@"La Asunción";
    dot2IM.legendEN=@"Assumption of Mary";
    dot2IM.originalImage = dot2IM.image;
    [page3Scroll addSubview:dot2IM];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDot2SingleTap:)];
    UITapGestureRecognizer *tap2IM = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [dot2 addGestureRecognizer:tap2];[dot2IM addGestureRecognizer:tap2IM];
    [dot2 setUserInteractionEnabled:YES];[dot2IM setUserInteractionEnabled:YES];
    [page3Scroll addSubview:dot2];
    
    // San Juan Bautista
    UIImageView *dot3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"circleicon.png"]];
    dot3.frame = CGRectMake(60+100, 515, 30, 30);
    dot3IM = [[PVImageView alloc] initWithImage:[UIImage imageNamed:@"santodomingosanjuan.jpg"]];
    dot3IM.frame = CGRectMake(60+100+15, 515+15, 1, 1);
    dot3IM.legend=@"San Juan Bautista";
    dot3IM.legendEN=@"John the Baptist";
    dot3IM.originalImage = dot3IM.image;
    [page3Scroll addSubview:dot3IM];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDot3SingleTap:)];
    UITapGestureRecognizer *tap3IM = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [dot3 addGestureRecognizer:tap3];[dot3IM addGestureRecognizer:tap3IM];
    [dot3 setUserInteractionEnabled:YES];[dot3IM setUserInteractionEnabled:YES];
    [page3Scroll addSubview:dot3];
    
    // San Juan Evangelista
    UIImageView *dot4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"circleicon.png"]];
    dot4.frame = CGRectMake(60+300, 515, 30, 30);
    dot4IM = [[PVImageView alloc] initWithImage:[UIImage imageNamed:@"santodomingosanjuan2.jpg"]];
    dot4IM.frame = CGRectMake(60+290, 515+15, 1, 1);
    dot4IM.legend=@"San Juan Evangelista";
    dot4IM.legendEN=@"John the Evangelist";
    dot4IM.originalImage = dot4IM.image;
    [page3Scroll addSubview:dot4IM];
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDot4SingleTap:)];
    UITapGestureRecognizer *tap4IM = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [dot4 addGestureRecognizer:tap4];[dot4IM addGestureRecognizer:tap4IM];
    [dot4 setUserInteractionEnabled:YES];[dot4IM setUserInteractionEnabled:YES];
    [page3Scroll addSubview:dot4];
    
    // Images
    
    PVImageView *caballero = [[PVImageView alloc]init];
    caballero.name=@"caballero.jpg";
    caballero.legend=@"Retrato del Caballero de la  mano en el pecho”, también conocido como “El Juramento del Caballero”. Óleo sobre lienzo, 1.584. Museo del Prado (Madrid)";
    caballero.legendEN=@"The Nobleman with his Hand on his Chest. Oil on Canvas. 1584. Prado Museum, Madrid";
    caballero.link = @"http://es.m.wikipedia.org/wiki/El_caballero_de_la_mano_en_el_pecho";
    caballero.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printRowFor:[NSArray arrayWithObjects:caballero, nil] at:page2Scroll withHeight:380 atX:60 Y:290];
    
    PVImageView *entierro = [[PVImageView alloc]init];
    entierro.name=@"entierro.jpg";
    entierro.legend=@"El Entierro del Conde de Orgaz”. Iglesia de Santo Tomé (Toledo) (España). Óleo sobre lienzo, 1.588";
    entierro.legendEN=@"The Burial of the Count of Orgaz. Oil on canvas. 1586. Santo Tomé, Toledo";
    entierro.link = @"http://es.m.wikipedia.org/wiki/El_entierro_del_Conde_de_Orgaz";
    entierro.linkEN=@"http://en.m.wikipedia.org/wiki/The_Burial_of_the_Count_of_Orgaz";
    entierro.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    [self printRowFor:[NSArray arrayWithObjects:entierro, nil] at:page2Scroll withHeight:400 atX:610 Y:900];
    
    
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


- (void)handleDot1SingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"dot1 tap");
    [self handleSimpleImageTap:recognizer onImage:dot1IM onPage:recognizer.view.superview];
}

- (void)handleDot2SingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"dot2 tap");
    [self handleSimpleImageTap:recognizer onImage:dot2IM onPage:recognizer.view.superview];
}

- (void)handleDot3SingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"dot3 tap");
    [self handleSimpleImageTap:recognizer onImage:dot3IM onPage:recognizer.view.superview];
}

- (void)handleDot4SingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"dot4 tap");
    [self handleSimpleImageTap:recognizer onImage:dot4IM onPage:recognizer.view.superview];
}

- (void)handleImageSingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"image tap");
    PVImageView *image = (PVImageView*) recognizer.view;
    [self handleSimpleImageTap:recognizer onImage:image onPage:recognizer.view.superview];
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];  
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Manierismo"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end

