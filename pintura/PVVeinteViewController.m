//
//  PVVeinteViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 10/13/12.
//
//

#import "PVVeinteViewController.h"
#import "PVLayoutServer.h"
#import "PV.h"
#import "PVImageView.h"

@interface PVVeinteViewController ()

@end

PVImageView *pescador, *paseo, *playa, *condesa, *moulin, *maurice;
UIView *page1,*page2, *page3,*page4, *page5,*page6;
UIScrollView *page2Scroll, *page3Scroll, *page4Scroll, *page5Scroll, *page6Scroll;

@implementation PVVeinteViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    //NSLog(@"Veinte View Controller viewDidLoad");
    self.section = 10;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2, Sorolla
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 655)];
    page2Scroll.contentSize = CGSizeMake(1024,3*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    double page2Offset = 0;
    double columnWidth = 400;
    
    // First Paragraph
    CGRect frame21 = [self.layout regularBlock:500 vOffset:page2Offset];
    [self loadPageContentForPage:2 Section:self.section AtFrame:frame21 OnView:page2Scroll scrolls:NO];
    
    // Second Paragraph
    CGRect frame22 = [self.layout rightBlock:800 offset:frame21.size.height leftOffset:columnWidth];
    [self loadPageContentForPage:3 Section:self.section AtFrame:frame22 OnView:page2Scroll scrolls:NO];
    page2Offset=frame21.size.height+frame22.size.height+30;
    
    // Pescador
    PVImageView *pescador = [[PVImageView alloc]init];
    pescador.name=@"pescador.jpg";
    pescador.legend=@"“El pescador”, 1.904, 76 cm 106 cm, Óleo sobre lienzo. Colección particular";
    pescador.link=@"http://es.m.wikipedia.org/wiki/El_Pescador";
    pescador.legendEN=@"The fisherman. 1904. Oil on canvas. Private collection";
    pescador.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    PVImageView *paseo = [[PVImageView alloc]init];
    paseo.name=@"paseo.jpg";
    paseo.legend=@"“Paseo a orillas del mar”, 1.909, 205 cm. 200 cm. Óleo sobre lienzo. Museo Sorolla (Madrid)";
    paseo.legendEN=@"A walk on the beach. 1909. Oil on canvas. Sorolla Museum, Madrid";
    paseo.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    
    [self printColumFor:[NSArray arrayWithObjects:pescador,paseo, nil] at:page2Scroll withWidth:columnWidth atX:60 Y:frame22.origin.y];
    
    
    // Ninos
    PVImageView *playa = [[PVImageView alloc]init];
    playa.name=@"playa.jpg";
    playa.legend=@"“Niños en la playa”, 1.910. Óleo sobre lienzo. Museo del Prado";
    playa.link=@"http://es.m.wikipedia.org/wiki/Ninos_en_la_playa";
    playa.legendEN=@"Kids on the beach. 1910. Oil on canvas. Private collection";
    playa.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:playa, nil] at:page2Scroll withWidth:830 atX:80 Y:page2Offset];
    
    
    
    // Content of page 3, Modernismo
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,2.6*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    double page3Offset = 0;
    
    // First Paragraph
    CGRect frame31 = [self.layout regularBlock:400 vOffset:page3Offset];
    [self loadPageContentForPage:5 Section:self.section AtFrame:frame31 OnView:page3Scroll scrolls:NO];
    page3Offset=page3Offset+frame31.size.height+30;
    

    // Moulin
    PVImageView *moulin = [[PVImageView alloc]init];
    moulin.name=@"moulin.jpg";
    moulin.legend=@"“Au moulin de la Galette”, 1.892, 117 cm. 90 cm.  Óleo sobre lienzo. Museo del Monasterio de Montserrat";
    moulin.link=@"http://es.m.wikipedia.org/wiki/Au_Moulin_de_la_Galette";
    moulin.legendEN=@"Au moulin de la Galette. 1892. Oil on canvas. Monserrat Monastery Museum";
    moulin.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:moulin, nil] at:page3Scroll withWidth:320 atX:60 Y:page3Offset];
    
    
    page3Offset = page3Offset+moulin.frame.size.height+400;
    
    // Second Paragraph
    CGRect frame32 = [self.layout rightBlock:1150 offset:frame31.size.height leftOffset:330];
    [self loadPageContentForPage:6 Section:self.section AtFrame:frame32 OnView:page3Scroll scrolls:NO];
    
    // Condesa
    PVImageView *condesa = [[PVImageView alloc]init];
    condesa.name=@"condesa.jpg";
    condesa.legend=@"“Condesa de Noailles”, 1.913, 151 cm. 156 cm";
    condesa.legendEN=@"Countess of Noailles. Zuloaga. Oil on canvas. 1913";
    condesa.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:condesa, nil] at:page3Scroll withWidth:320 atX:60 Y:page3Offset];
    
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
    [tracker set:kGAIScreenName value:@"Principios siglo XX"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
