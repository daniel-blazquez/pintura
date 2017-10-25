//
//  PVGoticoViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVGoticoViewController.h"
#import "PVImageView.h"

@interface PVGoticoViewController ()

@end

@implementation PVGoticoViewController

PVImageView *cantigas, *avia, *pedralbes, *santana, *bestiario, *sanpedro, *sanjorge, *consellers, *abdon;
UIView *page1,*page2, *page3, *page4;
UIScrollView *page2Scroll, *page3Scroll, *page4Scroll;

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"Gotico View Controller viewDidLoad");
    self.section = 4;
    
    // Title
    [self displayTitleOfPage:1 AtSection:4 InView:self.scrollview];
    
    // Content of page 1
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 655)];
    page2Scroll.contentSize = CGSizeMake(1024,2*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame2 = CGRectMake(50, 60+230, 900, 600);
    [self loadPageContentForPage:2 Section:4 AtFrame:frame2 OnView:page2Scroll scrolls:NO];
    
    CGRect frame21 = CGRectMake(50, 980, 900, 600);
    [self loadPageContentForPage:3 Section:4 AtFrame:frame21 OnView:page2Scroll scrolls:NO];
    
    // Content of page 3
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,2*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame3 = CGRectMake(330, 30, 600, 400);
    [self loadPageContentForPage:4 Section:4 AtFrame:frame3 OnView:page3Scroll scrolls:NO];
     
    CGRect frame35 = CGRectMake(60, 450, 600, 900);
    [self loadPageContentForPage:5 Section:4 AtFrame:frame35 OnView:page3Scroll scrolls:NO];
    
    // Content of page 4
    page4Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(3*1024, 60, 1024, 655)];
    page4Scroll.contentSize = CGSizeMake(1024,1.5*768);
    page4Scroll.delegate = self;
    page4Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame4 = CGRectMake(400, 0, 575, 600);
    [self loadPageContentForPage:6 Section:4 AtFrame:frame4 OnView:page4Scroll scrolls:NO];
    
    CGRect frame45 = CGRectMake(60, 575, 600, 900);
    [self loadPageContentForPage:7 Section:4 AtFrame:frame45 OnView:page4Scroll scrolls:NO]; 
    
    

    
    // Images
    
    PVImageView *cantigas = [[PVImageView alloc]init];
    cantigas.name=@"cantigas.jpg";
    cantigas.legend=@"Miniaturas de “Las Cantigas” de Alfonso X el Sabio. Códice del Monasterio de San Lorenzo de El Escorial";
    cantigas.legendEN=@"“Las Cantigas” miniatures. Codex of the monastery of San Lawrence of El Escorial";
    cantigas.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    
    PVImageView *avia = [[PVImageView alloc]init];
    avia.name=@"avia.jpg";
    avia.legend=@"Frontal de Avià”. Hacia 1.200. Anónimo. 107cm. 177cm. Museo Nacional de Arte de Cataluña";
    avia.legendEN=@"Avià altar. Circa 1200. 107cm. 177cm. National Art Museum of Catalonia";
    avia.link=@"http://es.m.wikipedia.org/wiki/Frontal_de_Avi%C3%A0";
    avia.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    
    NSArray *page2apinturas = [NSArray arrayWithObjects:cantigas,avia, nil];
    [self printRowFor:page2apinturas at:page2Scroll withHeight:250 atX:130 Y:0];
    

    PVImageView *pedralbes = [[PVImageView alloc]init];
    pedralbes.name=@"pedralbes.jpg"; 
    pedralbes.legend=@"Pinturas murales del Monasterio de Pedralbes. Ferrer Basa. Capilla de San Miguel (Barcelona)";
    pedralbes.legendEN=@"Mural paintings in the Pedralbes Monastery. Ferrer Basa. Saint Michael chapel, Barcelona";
    pedralbes.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    
    PVImageView *santana = [[PVImageView alloc]init];
    santana.name=@"santaana.jpg";
    santana.legend=@"Santa Ana. Ramón Destorrents. Catedral de Palma de Mallorca";
    santana.legendEN=@"Saint Anna. Ramón Destorrents. Palma de Mallorca cathedral";
    santana.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page3pinturas = [NSArray arrayWithObjects:pedralbes,santana, nil];
    [self printRowFor:page3pinturas at:page2Scroll withHeight:400 atX:110 Y:545];
    
    
    PVImageView *sanpedro = [[PVImageView alloc]init];
    sanpedro.name=@"sanpedro.jpg";
    sanpedro.legend=@"Luis Borrassá: “San Pedro salvado de las aguas";
    sanpedro.legendEN=@"Luis Borrassá: “Saint Peter rescued from the waters";
    sanpedro.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    sanpedro.link = @"http://es.m.wikipedia.org/wiki/Lluis_Borrassa";
    sanpedro.linkEN = @"http://en.m.wikipedia.org/wiki/Llu%C3%ADs_Borrass%C3%A0";
    
    NSArray *page3apinturas = [NSArray arrayWithObjects:sanpedro, nil];
    [self printColumFor:page3apinturas at:page3Scroll withWidth:250 atX:60 Y:0];
    
    PVImageView *sanjorge =[[PVImageView alloc]init];
    sanjorge.name=@"sanjorge.jpg";
    sanjorge.legend=@"Bernart Martorell: “San Jorge matando al dragón”";
    sanjorge.legendEN=@"Bernart Martorell: “St. George killing the dragon”";
    sanjorge.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:sanjorge, nil] at:page3Scroll withWidth:250 atX:700 Y:520];

    
    PVImageView *consellers = [[PVImageView alloc]init];
    consellers.name=@"consellers.jpg";
    consellers.legend=@"Luís Dalmau: “Virgen de los Consellers” Museo Nacional de Arte de Cataluña (Barcelona)";
    consellers.legendEN=@"Luís Dalmau: “Consellers Virgin” at the National Art Museum of Catalonia";
    consellers.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page4apinturas = [NSArray arrayWithObjects:consellers, nil];
    [self printColumFor:page4apinturas at:page4Scroll withWidth:300 atX:60 Y:100];
    
    
    PVImageView *abdon = [[PVImageView alloc]init];
    abdon.name=@"abdon.jpg";
    abdon.legend=@"Jaime Huguet: “Predicación de San  Ambrosio - Retablo de San Agustín, detalle central)";
    abdon.legendEN=@"Saint Augustine Altarpiece. Jaime Huguet. 1460";
    abdon.link = @"http://es.m.wikipedia.org/wiki/Retablo_de_San_Agust%C3%ADn";
    abdon.linkEN = @"http://en.m.wikipedia.org/wiki/Saint_Augustine_Altarpiece_(Huguet)";
    abdon.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page4bpinturas = [NSArray arrayWithObjects:abdon, nil];
    [self printColumFor:page4bpinturas at:page4Scroll withWidth:250 atX:700 Y:580];
    
    // Finalize configuration of scrollview
    [self.scrollview addSubview:page1];
    [self.scrollview addSubview:page2Scroll];
    [self.scrollview addSubview:page3Scroll];
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

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    [super scrollViewDidScroll:sender];
}


- (void)handleImageSingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"image tap");
    PVImageView *image = (PVImageView*) recognizer.view;
    [self handleSimpleImageTap:recognizer onImage:image onPage:recognizer.view.superview];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];  
}

- (void)handleInteractiveSingleTap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"interactive tap");
    PVImageView *image = (PVImageView*) recognizer.view;
    self.imageSegue = image.name;
    self.imageSegueTitle = image.legend;
    [self performSegueWithIdentifier:@"interactive" sender:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Gotico"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}


@end
