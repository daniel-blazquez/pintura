//
//  PVGoyaViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVGoyaViewController.h"
#import "PVLayoutServer.h"
#import "PV.h"
#import "PVImageView.h"


@interface PVGoyaViewController ()

@end

@implementation PVGoyaViewController

PVImageView *mamelucos, *fusilamientos, *desnuda, *vestida, *familia, *sopa, *lechera;
UIView *page1,*page2, *page3,*page4, *page5,*page6, *page7, *page8;
UIScrollView *page2Scroll, *page3Scroll, *page4Scroll, *page5Scroll, *page6Scroll, *page7Scroll, *page8Scroll;

- (void)viewDidLoad{
    
    [super viewDidLoad];
    //NSLog(@"Goya View Controller viewDidLoad");
    self.section = 8;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1, Intro
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2, pintura religiosa
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 655)];
    page2Scroll.contentSize = CGSizeMake(1024,3.5*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    double page2Offset = 0;
    double columnWidth = 400;
    
    // First Paragraph
    CGRect frame21 = [self.layout regularBlock:360 vOffset:page2Offset];
    [self loadPageContentForPage:2 Section:self.section AtFrame:frame21 OnView:page2Scroll scrolls:NO];
    
    // Second Paragraph
    CGRect frame22 = [self.layout rightBlock:2500 offset:frame21.size.height leftOffset:columnWidth];
    [self loadPageContentForPage:3 Section:self.section AtFrame:frame22 OnView:page2Scroll scrolls:NO];
    
    // Column of images
    PVImageView *bernardino = [[PVImageView alloc]init];
    bernardino.name=@"sanbernardino.jpg";
    bernardino.legend=@"San Bernardino de Siena predicando ante Alfonso V de Aragón, 1.781-83, Óleo sobre lienzo, Real Basílica de San Francisco el Grande (Madrid)";
    bernardino.legendEN=@"Saint Bernardino of Siena, 1781-83. Oil on canvas. San Francisco el Grande Basilica, Madrid";
    bernardino.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    PVImageView *piedad = [[PVImageView alloc]init];
    piedad.name=@"piedad.jpg";
    piedad.legend=@"La Piedad (Atribuida), 1774, Colección privada";
    piedad.legendEN=@"The Pietà. 1774. Private collection";
    piedad.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    PVImageView *milagro = [[PVImageView alloc]init];
    milagro.name=@"milagro.jpg";
    milagro.legend=@"Milagro de San Antonio de Padua, Detalle de la cúpula, 1.798. Fresco en San Antonio de la Florida (Madrid)";
    milagro.legendEN=@"Miracle of Saint Anthony of Padua, detail of the dome, 1798. Fresco in San Antonio de la Florida,Madrid";
    milagro.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];

    NSArray *page2pinturas = [NSArray arrayWithObjects:bernardino,piedad, milagro, nil];
    [self printColumFor:page2pinturas at:page2Scroll withWidth:columnWidth atX:60 Y:frame21.size.height];
    
    // Content of page 3, caprichos
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,2.5*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    double page3Offset = 0;
    double column2Width = 400;
    
    // First Paragraph
    CGRect frame31 = [self.layout regularBlock:600 vOffset:page3Offset];
    [self loadPageContentForPage:4 Section:self.section AtFrame:frame31 OnView:page3Scroll scrolls:NO];
    
    // Second Paragraph
    CGRect frame32 = [self.layout rightBlock:1000 offset:frame31.size.height leftOffset:column2Width];
    [self loadPageContentForPage:5 Section:self.section AtFrame:frame32 OnView:page3Scroll scrolls:NO];
    
    PVImageView *vendimia = [[PVImageView alloc]init];
    vendimia.name=@"vendimia.jpg";
    vendimia.legend=@"La Vendimia (o El Otoño), 1.786-87. Museo del Prado (Madrid)";
    vendimia.link=@"http://es.m.wikipedia.org/wiki/La_vendimia";
    vendimia.legendEN=@"The Vintage (or The Fall). 1786-87. Prado Museum, Madrid";
    vendimia.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page3pinturas = [NSArray arrayWithObjects:vendimia, nil];
    [self printColumFor:page3pinturas at:page3Scroll withWidth:columnWidth atX:60 Y:frame31.size.height];

    
    // Content of page 4
    page4Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(3*1024, 60, 1024, 655)];
    page4Scroll.contentSize = CGSizeMake(1024,2*768);
    page4Scroll.delegate = self;
    page4Scroll.showsVerticalScrollIndicator = NO;
    double page4Offset = 0;
    double column4Width = 400;
    
    // First Paragraph
    CGRect frame41 = [self.layout regularBlock:600 vOffset:page4Offset];
    [self loadPageContentForPage:6 Section:self.section AtFrame:frame41 OnView:page4Scroll scrolls:NO];
    
    // Second Paragraph
    CGRect frame42 = [self.layout rightBlock:1000 offset:frame41.size.height leftOffset:column4Width];
    [self loadPageContentForPage:7 Section:self.section AtFrame:frame42 OnView:page4Scroll scrolls:NO];
    
    PVImageView *cantaro = [[PVImageView alloc]init];
    cantaro.name=@"cantaro.jpg";
    cantaro.legend=@"Se quebró el cántaro";
    cantaro.legendEN=@"He broke the pitcher";
    cantaro.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page4pinturas = [NSArray arrayWithObjects:cantaro, nil];
    [self printColumFor:page4pinturas at:page4Scroll withWidth:columnWidth atX:60 Y:frame41.size.height];
    
    // Content of page 5
    page5Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(4*1024, 60, 1024, 655)];
    page5Scroll.contentSize = CGSizeMake(1024,2.6*768);
    page5Scroll.delegate = self;
    page5Scroll.showsVerticalScrollIndicator = NO;
    double page5Offset = 0;
    double column5Height = 400;
    
    // First Paragraph
    CGRect frame51 = [self.layout regularBlock:440 vOffset:page5Offset];
    [self loadPageContentForPage:8 Section:self.section AtFrame:frame51 OnView:page5Scroll scrolls:NO];
    page5Offset=page5Offset+frame51.size.height+30;
    
    PVImageView *mam = [[PVImageView alloc]init];
    mam.name=@"mamelucos.jpg";
    mam.legend=@"“La Carga de los mamelucos” 1.814, Óleo sobre lienzo, Museo del Prado (Madrid)";
    mam.legendEN=@"The Second of May 1808 (The Charge of the Mamelukes). 1814. Oil on canvas. Prado Museum, Madrid";
    mam.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printRowFor:[NSArray arrayWithObjects:mam, nil] at:page5Scroll withHeight:column5Height atX:240 Y:page5Offset];
    page5Offset+=column5Height+30;
    
    // Second Paragraph
    CGRect frame52 = [self.layout regularBlock:230 vOffset:page5Offset];
    [self loadPageContentForPage:9 Section:self.section AtFrame:frame52 OnView:page5Scroll scrolls:NO];
    page5Offset=page5Offset+frame52.size.height;
    
    fusilamientos = [[PVImageView alloc] init];
    fusilamientos.name=@"fusilamientos.jpg";
    fusilamientos.legend=@"“Los fusilamientos del 3 Mayo de 1.808”, Óleo sobre lienzo, Museo del Prado (Madrid)";
    fusilamientos.legendEN=@"The Third of May 1808. Oil on canvas, Prado Museum, Madrid";
    fusilamientos.link=@"http://es.m.wikipedia.org/wiki/El_tres_de_mayo_de_1808_en_Madrid";
    fusilamientos.linkEN=@"http://en.m.wikipedia.org/wiki/The_Third_of_May_1808";
    fusilamientos.recog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    [self printRowFor:[NSArray arrayWithObjects:fusilamientos, nil] at:page5Scroll withHeight:column5Height atX:240 Y:page5Offset];
    page5Offset+=fusilamientos.frame.size.height+30;
    
    // Third Paragraph
    CGRect frame53 = [self.layout regularBlock:400 vOffset:page5Offset];
    [self loadPageContentForPage:10 Section:self.section AtFrame:frame53 OnView:page5Scroll scrolls:NO];
    
    // Content of page 6
    page6Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(5*1024, 60, 1024, 655)];
    page6Scroll.contentSize = CGSizeMake(1024,3.6*768);
    page6Scroll.delegate = self;
    page6Scroll.showsVerticalScrollIndicator = NO;
    double page6Offset = 0;
    
    // First Paragraph
    CGRect frame61 = [self.layout regularBlock:260 vOffset:page6Offset];
    [self loadPageContentForPage:11 Section:self.section AtFrame:frame61 OnView:page6Scroll scrolls:NO];
    page6Offset=page6Offset+frame61.size.height+20;
    
    vestida = [[PVImageView alloc] init];
    vestida.name=@"vestida.jpg";
    vestida.legend=@"La maja vestida, 1.798-1.805?, Óleo sobre lienzo, 95 cm. 190 cm, Museo del Prado (Madrid)";
    vestida.legendEN=@"The Clothed Maja, 1798-1805. Oil on canvas, Prado Museum, Madrid";
    vestida.link=@"http://es.m.wikipedia.org/wiki/La_maja_vestida";
    vestida.linkEN=@"http://en.m.wikipedia.org/wiki/The_Clothed_Maja";
    vestida.recog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    desnuda = [[PVImageView alloc] init];
    desnuda.name=@"desnuda.jpg";
    desnuda.legend=@"La maja desnuda, 1.798-1.805?, Óleo sobre lienzo, 95 cm. 190 cm. Museo del Prado (Madrid)";
    desnuda.legendEN=@"The Naked Maja, 1798-1805. Oil on canvas, Prado Museum, Madrid";
    desnuda.recog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    [self printColumFor:[NSArray arrayWithObjects:vestida, desnuda, nil] at:page6Scroll withWidth:600 atX:200 Y:page6Offset];
    page6Offset = page6Offset + vestida.frame.size.height+30+desnuda.frame.size.height+80;

    
    // Second Paragraph
    CGRect frame62 = [self.layout regularBlock:500 vOffset:page6Offset];
    [self loadPageContentForPage:12 Section:self.section AtFrame:frame62 OnView:page6Scroll scrolls:NO];
    page6Offset=page6Offset+frame62.size.height;
    
    
    familia = [[PVImageView alloc] init];
    familia.name=@"familia.jpg";
    familia.legend=@"“La Familia de Carlos IV”, 1.800-01, Óleo sobre lienzo, 280 cm. 336 cm. Museo del Prado (Madrid)";
    familia.legendEN=@"The family of Charles VI. Oil on canvas, Prado Museum, Madrid";
    familia.recog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    [self printColumFor:[NSArray arrayWithObjects:familia, nil] at:page6Scroll withWidth:400 atX:240 Y:page6Offset];
    page6Offset = page6Offset + familia.frame.size.height+30;

    
    // Third Paragraph
    CGRect frame63 = [self.layout regularBlock:800 vOffset:page6Offset];
    [self loadPageContentForPage:13 Section:self.section AtFrame:frame63 OnView:page6Scroll scrolls:NO];
    
    // Content of page 7
    page7Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(6*1024, 30, 1024, 655)];
    page7Scroll.contentSize = CGSizeMake(1024,1*768);
    page7Scroll.delegate = self;
    page7Scroll.showsVerticalScrollIndicator = NO;
    double page7Offset = 0;
    double column7Width = 450;
     
    sopa = [[PVImageView alloc] init];
    sopa.name=@"sopa.jpg";
    sopa.legend=@"Dos viejos comiendo sopa. 1819-23. Óleo sobre lienzo. Museo de El Prado";
    sopa.legendEN=@"Two Old Men Eating Soup. 1819-23. Oil on canvas. Prado Museum.";
    sopa.recog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:sopa, nil] at:page7Scroll withWidth:column7Width atX:250 Y:30];
    page7Offset=page7Offset+sopa.frame.size.height+80;
    CGRect frame71 = [self.layout regularBlock:800 vOffset:page7Offset];
    [self loadPageContentForPage:14 Section:self.section AtFrame:frame71 OnView:page7Scroll scrolls:NO];
    
    // Content of page 8
    page8Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(7*1024, 60, 1024, 655)];
    page8Scroll.contentSize = CGSizeMake(1024,1.1*768);
    page8Scroll.delegate = self;
    page8Scroll.showsVerticalScrollIndicator = NO;
    double page8Offset = 0;
    double column8Width = 380;
    
    // First Paragraph
    CGRect frame81 = [self.layout rightBlock:800 offset:page8Offset leftOffset:column8Width];
    [self loadPageContentForPage:15 Section:self.section AtFrame:frame81 OnView:page8Scroll scrolls:NO];
    
    lechera = [[PVImageView alloc] init];
    lechera.name=@"lechera.jpg";
    lechera.legend=@"“La lechera de Burdeos”, 1.827, Óleo sobre lienzo. 74 cm 68 cm Museo del Pradoa";
    lechera.legendEN=@"The Milkmaid of Bordeaux. 1827. Oil on canvas. Prado Museum.";
    lechera.recog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:lechera, nil] at:page8Scroll withWidth:column8Width atX:60 Y:30];
    
    // Finalize configuration of scrollview
    [self.scrollview addSubview:page1];
    [self.scrollview addSubview:page2Scroll];
    [self.scrollview addSubview:page3Scroll];
    [self.scrollview addSubview:page4Scroll];
    [self.scrollview addSubview:page5Scroll];
    [self.scrollview addSubview:page6Scroll];
    [self.scrollview addSubview:page7Scroll];
    [self.scrollview addSubview:page8Scroll];
    self.scrollview.contentSize = CGSizeMake(8*1024, 768);
    self.scrollview.delegate = self;
    [self.view addSubview:self.scrollview];
    
    // Finalize configuration of pager
    self.pageControl.numberOfPages = 8;
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
    [tracker set:kGAIScreenName value:@"Goya"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
