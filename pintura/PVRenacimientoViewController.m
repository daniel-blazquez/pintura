//
//  PVRenacimientoViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVRenacimientoViewController.h"
#import "PVImageView.h"

@interface PVRenacimientoViewController ()

@end

@implementation PVRenacimientoViewController

PVImageView *santacatalina, *nacimiento, *autodefe, *purificacion, *lactante, *infanta, *suegra;
UIView *page1,*page2, *page3, *page4;
UIScrollView *page2Scroll, *page3Scroll, *page4Scroll;

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"Renacimiento View Controller viewDidLoad");
    self.section = 5;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1, Intro
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 655)];
    page2Scroll.contentSize = CGSizeMake(1024,2*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame2 = CGRectMake(330, 0, 600, 1500);
    [self loadPageContentForPage:2 Section:5 AtFrame:frame2 OnView:page2Scroll scrolls:NO];
    
    // Content of page 3
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,2*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame3 = CGRectMake(300, 0, 630, 480);
    [self loadPageContentForPage:3 Section:5 AtFrame:frame3 OnView:page3Scroll scrolls:NO];
    
    CGRect frame35 = CGRectMake(60, 500, 360, 900);
    [self loadPageContentForPage:4 Section:5 AtFrame:frame35 OnView:page3Scroll scrolls:NO];
    
    // Content of page 4
    page4Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(3*1024, 60, 1024, 655)];
    page4Scroll.contentSize = CGSizeMake(1024,1.5*768);
    page4Scroll.delegate = self;
    page4Scroll.showsVerticalScrollIndicator = NO;
    
    CGRect frame4 = CGRectMake(60, 0, 830, 600);
    [self loadPageContentForPage:5 Section:5 AtFrame:frame4 OnView:page4Scroll scrolls:NO];
    
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
    
    // Images
    
    PVImageView *santacatalina = [[PVImageView alloc]init];
    santacatalina.name=@"santacatalina.jpg";
    santacatalina.legend=@"Fernando Yañez de la Almedina, Catalina de Alejandría.Óleo sobre tabla. 212cm.112cm";
    santacatalina.legendEN=@"Saint Catherine of Alexandria, c. 1510, oil on canvas, in the Museo del Prado, Madrid";
    santacatalina.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    santacatalina.link = @"http://es.m.wikipedia.org/wiki/Fernando_Yanez_de_la_Almedina";
    santacatalina.linkEN = @"http://en.m.wikipedia.org/wiki/Fernando_Yanez_de_la_Almedina";
    
    PVImageView *nacimiento = [[PVImageView alloc]init];
    nacimiento.name=@"nacimiento.jpg";
    nacimiento.legend=@"El nacimiento de la Virgen, fresco, 1509-1511, Sala Capitular de la Catedral de Toledo.";
    nacimiento.legendEN=@"The Birth of the Virgin, fresco by Juan de Borgoña, Cathedral of Toledo, c. 1495";
    nacimiento.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    nacimiento.link = @"http://es.m.wikipedia.org/wiki/Juan_de_Borgona";
    nacimiento.linkEN = @"http://en.m.wikipedia.org/wiki/Juan_de_Borgona";
    
    PVImageView *autodefe = [[PVImageView alloc]init];
    autodefe.name=@"auto.jpg";
    autodefe.legend=@"Pedro Berruguete: Auto de fe presidido por Santo Domingo de Guzmán, retablo de Santo Tomás de Ávila";
    autodefe.legendEN=@"Pedro Berruguete: Auto de fe presided by Santo Domingo de Guzmán, Sain Thomas altarpiece, Ávila";
    autodefe.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page2apinturas = [NSArray arrayWithObjects:santacatalina, nacimiento, autodefe, nil];
    [self printColumFor:page2apinturas at:page2Scroll withWidth:250 atX:60 Y:0];

    
    PVImageView *purificacion = [[PVImageView alloc]init];
    purificacion.name=@"purificacion.jpg";
    purificacion.legend=@"Pedro de Campaña, Purificación de María. Capilla del Mariscal Diego. Catedral de Sevilla";
    purificacion.legendEN=@"Pedro de Campaña, Mary's Purification. Mariscal Diego chapel. Cathedral de Sevilla";
    purificacion.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printRowFor:[NSArray arrayWithObjects:purificacion, nil] at:page3Scroll withHeight:300 atX:60 Y:60];
    
    PVImageView *lactante = [[PVImageView alloc]init];
    lactante.name=@"lactante.jpg";
    lactante.legend=@"Luís de Morales, Virgen de la Leche";
    lactante.legendEN=@"Luís de Morales, Lactating Virgin";
    lactante.link = @"http://es.wikipedia.org/wiki/Virgen_de_la_leche_(Luis_de_Morales)";
    lactante.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    [self printRowFor:[NSArray arrayWithObjects:lactante, nil] at:page3Scroll withHeight:500 atX:450 Y:500];

    PVImageView *infanta = [[PVImageView alloc]init];
    infanta.name=@"infanta.jpg";
    infanta.legend=@"Alonso Sánchez Coello, Retrato de la Infanta Isabel Clara Eugenia”. Museo del Prado (Madrid)";
    infanta.legendEN=@"Alonso Sánchez Coello, portraoit of infanta Isabella Clara Eugenia”. Museo del Prado (Madrid)";
    infanta.link=@"http://es.m.wikipedia.org/wiki/Retrato_de_la_infanta_Isabel_Clara_Eugenia";
    infanta.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    PVImageView *suegra = [[PVImageView alloc]init];
    suegra.name=@"suegra.jpg";
    suegra.legend=@"Juan Pantoja de la Cruz: “Nacimiento de la Virgen”. 1603. Es en realidad un retrato de la suegra del rey Felipe III";
    suegra.legendEN=@"Juan Pantoja de la Cruz: “Birth of a Virgin”. 1603. In really, it depicts the mother in law of Philip III";
    suegra.link=@"http://es.m.wikipedia.org/wiki/Juan_Pantoja_de_la_Cruz";
    suegra.linkEN=@"http://en.m.wikipedia.org/wiki/Juan_Pantoja_de_la_Cruz";
    suegra.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page4pinturas = [NSArray arrayWithObjects:infanta,suegra, nil];
    [self printRowFor:page4pinturas at:page4Scroll withHeight:450 atX:90 Y:500];

    
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
    [tracker set:kGAIScreenName value:@"Renacimiento"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
