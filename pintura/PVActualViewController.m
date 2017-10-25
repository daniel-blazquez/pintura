//
//  PVActualViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 10/21/12.
//
//

#import "PVActualViewController.h"
#import "PVLayoutServer.h"
#import "PV.h"
#import "PVImageView.h"

@interface PVActualViewController ()

@end


PVImageView *persistencia, *siesta, *masia, *interior, *hombre;
UIView *page1,*page2, *page3,*page4, *page5,*page6;
UIScrollView *page2Scroll, *page3Scroll, *page4Scroll, *page5Scroll, *page6Scroll;

@implementation PVActualViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    //NSLog(@"Actual View Controller viewDidLoad");
    self.section = 12;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1, Intro
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];

    // Content of page 2, Dali
    page2 = [[UIView alloc] initWithFrame:self.p2Frame];
    [self loadPageContentForPage:2 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page2 scrolls:YES];
    
    // Content of page 3, Obra de Dali
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,3.5*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    double page3Offset = 0;
    
    // La Persistencia de la Memoria
    PVImageView *persistencia = [[PVImageView alloc]init];
    persistencia.name=@"persistencia.jpg";
    persistencia.legend=@"“La persistencia de la memoria” o “Los relojes blandos”, 1.931, Museo de Arte Moderno de Nueva York 24 cm. 33 cm. Óleo sobre lienzo";
    persistencia.legendEN=@"The Persistence of Memory. 1931. Museum of Modern Art, New York City";
    persistencia.link=@"http://es.m.wikipedia.org/wiki/La_persistencia_de_la_memoria";
    persistencia.linkEN=@"http://en.m.wikipedia.org/wiki/The_Persistence_of_Memory";
    persistencia.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:persistencia, nil] at:page3Scroll withWidth:500 atX:240 Y:page3Offset];
    
    page3Offset = page3Offset+persistencia.frame.size.height+60;
    
    // First Paragraph
    CGRect frame31 = [self.layout regularBlock:300 vOffset:page3Offset];
    [self loadPageContentForPage:3 Section:self.section AtFrame:frame31 OnView:page3Scroll scrolls:NO];
    page3Offset=page3Offset+frame31.size.height;
    double columnWidth = 330;
    
    // Second Paragraph
    CGRect frame32 = [self.layout rightBlock:1700 offset:page3Offset leftOffset:columnWidth];
    [self loadPageContentForPage:4 Section:self.section AtFrame:frame32 OnView:page3Scroll scrolls:NO];
    
    // Column of images
    PVImageView *madonna = [[PVImageView alloc]init];
    madonna.name=@"madonna.jpg";
    madonna.legend=@"La Madonna de Port Lligat” 1.950. 144 cm. 96 cm. Óleo sobre lienzo. Colección Particular";
    madonna.legendEN=@"The Madonna of Port Lligat. 1950. Oil on canvas. Private collection.";
    madonna.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    madonna.bottomPadding = 250;
   
    PVImageView *cristo = [[PVImageView alloc]init];
    cristo.name=@"cristo.jpg";
    cristo.legend=@"“Cristo de San Juan de la Cruz” 1.951, 205 cm. 116 cm. Óleo sobre lienzo. Museo Kelvingrave, Glasgow (Reino Unido)";
    cristo.legendEN=@"Christ of Saint John of the Cross. 1951. Oil on canvas. Kelvingrade Museum, Glasgow";
    cristo.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    PVImageView *crucifixion = [[PVImageView alloc]init];
    crucifixion.name=@"crucifixion.jpg";
    crucifixion.legend=@"La Crucifixión o Corpus hypercubus, 1.954, 194,5 x 124 cm,  Museo Metropolitano de Arte de Nueva York";
    crucifixion.legendEN=@"Crucifixion (Corpus Hypercubus). 1954. Metropolitan Museum of Art, New York City";
    crucifixion.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page3pinturas = [NSArray arrayWithObjects:madonna,cristo, crucifixion, nil];
    [self printColumFor:page3pinturas at:page3Scroll withWidth:columnWidth atX:60 Y:page3Offset];

    
    // Content of page 4, Miro
    page4 = [[UIView alloc] initWithFrame:self.p4Frame];
    [self loadPageContentForPage:5 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page4 scrolls:YES];
    
    // Content of page 5, Obra de Miro
    page5Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(4*1024, 60, 1024, 655)];
    page5Scroll.contentSize = CGSizeMake(1024,2.6*768);
    page5Scroll.delegate = self;
    page5Scroll.showsVerticalScrollIndicator = NO;
    double page5Offset = 0;
    
    // La Masia y La Siesta
    PVImageView *masia = [[PVImageView alloc]init];
    masia.name=@"masia.jpg";
    masia.legend=@"“La Masía” 1.922, 123 cm × 141 cm, Óleo sobre lienzo. National Gallery of Art";
    masia.legendEN=@"The Farm. 1922. Oil on canvas. National Gallery of Art, Washington";
    masia.link=@"http://es.m.wikipedia.org/wiki/La_mas%C3%ADa";
    masia.linkEN=@"http://en.m.wikipedia.org/wiki/The_Farm_(Mir%C3%B3)";
    masia.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    PVImageView *siesta = [[PVImageView alloc]init];
    siesta.name=@"siesta.jpg";
    siesta.legend=@"“Siesta” 1.925, 97 cm. 146 cm, Óleo sobre lienzo. Centro Georges Pompidou, París (Francia)";
    siesta.legendEN=@"Nap. 1925. Oil on canvas. Georges Pompidou Center, Paris";
    siesta.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    [self printRowFor:[NSArray arrayWithObjects:masia, siesta, nil] at:page5Scroll withHeight:300 atX:60 Y:page5Offset];
    
    
    page5Offset = page5Offset+siesta.frame.size.height+60;
    
    // First Paragraph
    CGRect frame51 = [self.layout regularBlock:550 vOffset:page5Offset];
    [self loadPageContentForPage:6 Section:self.section AtFrame:frame51 OnView:page5Scroll scrolls:NO];
    page5Offset=page5Offset+frame51.size.height;
    columnWidth = 330;
    
    // Column of images
    PVImageView *interior = [[PVImageView alloc]init];
    interior.name=@"interior.jpg";
    interior.legend=@"“Interior Holandés I” 1.925";
    interior.legendEN=@"The Dutch interiors, I, 1925";
    interior.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    interior.bottomPadding = 170;
    
    PVImageView *hombre = [[PVImageView alloc]init];
    hombre.name=@"hombre.jpg";
    hombre.legend=@"“Hombre y mujer delante de un montón de excrementos” 1.936, 23’2cm. 32 cm, Óleo sobre lámina metálica";
    hombre.legendEN=@"Man and Woman in Front of a Pile of Excrement, 1936, 23cm x 32cm, Oil on copper";
    hombre.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page5pinturas = [NSArray arrayWithObjects:interior,hombre, nil];
    [self printColumFor:page5pinturas at:page5Scroll withWidth:columnWidth atX:60 Y:page5Offset];
    
    // Second Paragraph
    CGRect frame52 = [self.layout rightBlock:1150 offset:page5Offset leftOffset:columnWidth];
    [self loadPageContentForPage:7 Section:self.section AtFrame:frame52 OnView:page5Scroll scrolls:NO];
    
    
    // Finalize configuration of scrollview
    [self.scrollview addSubview:page1];
    [self.scrollview addSubview:page2];
    [self.scrollview addSubview:page3Scroll];
    [self.scrollview addSubview:page4];
    [self.scrollview addSubview:page5Scroll];
    
    self.scrollview.contentSize = CGSizeMake(5*1024, 768);
    self.scrollview.delegate = self;
    [self.view addSubview:self.scrollview];
    
    // Finalize configuration of pager
    self.pageControl.numberOfPages = 5;
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
    [tracker set:kGAIScreenName value:@"Surrealismo"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end

