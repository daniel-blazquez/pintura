//
//  PVRomanViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 10/10/12.
//
//

#import "PVRomanViewController.h"
#import "PVLayoutServer.h"
#import "PV.h"
#import "PVImageView.h"

@interface PVRomanViewController ()

@end

@implementation PVRomanViewController

PVImageView *poetas, *gaucin, *veterano, *trata, *pescado;
UIView *page1,*page2, *page3,*page4, *page5,*page6;
UIScrollView *page2Scroll, *page3Scroll, *page4Scroll, *page5Scroll, *page6Scroll;

- (void)viewDidLoad{
    
    [super viewDidLoad];
    //NSLog(@"Romanticismo View Controller viewDidLoad");
    self.section = 9;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 655)];
    page2Scroll.contentSize = CGSizeMake(1024,2.5*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    double page2Offset = 0;
    double columnWidth = 400;
    
    // First Paragraph
    CGRect frame21 = [self.layout regularBlock:230 vOffset:page2Offset];
    [self loadPageContentForPage:2 Section:self.section AtFrame:frame21 OnView:page2Scroll scrolls:NO];
    page2Offset+=frame21.size.height;
    
    // Second Paragraph
    CGRect frame22 = [self.layout rightBlock:690 offset:frame21.size.height leftOffset:columnWidth];
    [self loadPageContentForPage:3 Section:self.section AtFrame:frame22 OnView:page2Scroll scrolls:NO];
    page2Offset+=frame22.size.height;
    
    // Column of images
    PVImageView *vilches = [[PVImageView alloc]init];
    vilches.name=@"vilches.jpg";
    vilches.legend=@"Doña Amalia de Llano y Dotres, Condesa de Vilches,1.853, 126cm. 89 cm. Óleo sobre lienzo, Museo del Prado (Madrid)";
    vilches.legendEN=@"Countess of Vilches. 1853. Oil on Canvas. Prado Museum, Madrid";
    vilches.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page2pinturas = [NSArray arrayWithObjects:vilches, nil];
    [self printColumFor:page2pinturas at:page2Scroll withWidth:columnWidth atX:60 Y:frame21.size.height];
    
    // Third paragraph
    CGRect frame23 = [self.layout regularBlock:400 vOffset:page2Offset];
    [self loadPageContentForPage:4 Section:self.section AtFrame:frame23 OnView:page2Scroll scrolls:NO];
    page2Offset+=frame23.size.height;
    
    // Poetas
    PVImageView *poetas = [[PVImageView alloc]init];
    poetas.name=@"poetas.jpg";
    poetas.legend=@"Los poetas Contemporáneos o Lectura de José Zorrilla en el estudio del pintor, 1846";
    poetas.legendEN=@"The Contemporary Poets. A Reading of Zorilla at the Painter's Studio. 1846. Oil on Canvas. Prado Museum, Madrid";
    poetas.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:poetas, nil] at:page2Scroll withWidth:730 atX:100 Y:page2Offset];
    
    
    // Content of page 3
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,1.5*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    double page3Offset = 0;
    
    // First Paragraph
    CGRect frame31 = [self.layout regularBlock:400 vOffset:page3Offset];
    [self loadPageContentForPage:5 Section:self.section AtFrame:frame31 OnView:page3Scroll scrolls:NO];
    page3Offset+=frame31.size.height;
    
    // Castillo
    PVImageView *gaucin = [[PVImageView alloc]init];
    gaucin.name=@"gaucin.jpg";
    gaucin.legend=@"Castillo de Gaucín, 1.849, 148 cm. 224 cm, Óleo sobre lienzo. Museo del Prado (Madrid)";
    gaucin.legendEN=@"Gaucin Castle. 1849. Oil on Canvas. Prado Museum, Madrid";
    gaucin.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:gaucin, nil] at:page3Scroll withWidth:700 atX:150 Y:page3Offset];
    
    
    // Content of page 4
    page4Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(3*1024, 60, 1024, 655)];
    page4Scroll.contentSize = CGSizeMake(1024,1.5*768);
    page4Scroll.delegate = self;
    page4Scroll.showsVerticalScrollIndicator = NO;
    double page4Offset = 0;
    
    // First Paragraph
    CGRect frame41 = [self.layout regularBlock:630 vOffset:page4Offset];
    [self loadPageContentForPage:6 Section:self.section AtFrame:frame41 OnView:page4Scroll scrolls:NO];
    
    // Veterano
    PVImageView *veterano = [[PVImageView alloc]init];
    veterano.name=@"veterano.jpg";
    veterano.legend=@"Veterano narrando aventuras, 1.830, 48 cm. 59 cm., Óleo sobre lienzo, Museo del Prado";
    veterano.legendEN=@"Veteran narrating adventures. 1830. Oil on Canvas. Prado Museum, Madrid";
    veterano.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:veterano, nil] at:page4Scroll withWidth:700 atX:150 Y:page3Offset];
   
    // Content of page 5
    page5Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(4*1024, 60, 1024, 655)];
    page5Scroll.contentSize = CGSizeMake(1024,4*768);
    page5Scroll.delegate = self;
    page5Scroll.showsVerticalScrollIndicator = NO;
    double page5Offset = 0;
    double column5Width = 350;
    
    // First Paragraph
    CGRect frame51 = [self.layout regularBlock:200 vOffset:page5Offset];
    [self loadPageContentForPage:7 Section:self.section AtFrame:frame51 OnView:page5Scroll scrolls:NO];
    
    // Second Paragraph
    CGRect frame52 = [self.layout rightBlock:3000 offset:frame51.size.height leftOffset:column5Width];
    [self loadPageContentForPage:8 Section:self.section AtFrame:frame52 OnView:page5Scroll scrolls:NO];
    
    // Column of images
    PVImageView *comuneros = [[PVImageView alloc]init];
    comuneros.name=@"comuneros.jpg";
    comuneros.legend=@"Ejecución de los Comuneros de Castilla, 1.860, Congreso de los Diputados";
    comuneros.legendEN=@"Execution of the Comuneros of Castilla. 1860. Congress of Spain";
    comuneros.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    comuneros.bottomPadding = 420;
    
    PVImageView *monje = [[PVImageView alloc]init];
    monje.name=@"monje.jpg";
    monje.legend=@"“La leyenda del rey monje” o “La Campana de Huesca”, 1.880, 356cm 474 cm. Óleo sobre lienzo, Museo del Prado";
    monje.legendEN=@"The legend of the monk king. 1880. Oil on canvas. Prado Museum";
    monje.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    monje.bottomPadding = 290;
    
    PVImageView *isabel = [[PVImageView alloc]init];
    isabel.name=@"isabel.jpg";
    isabel.legend=@"“Dª Isabel la Católica dictando su testamento”, 1.864, 287 cm. 398 cm, Óleo sobre lienzo. Museo del Prado";
    isabel.legendEN=@"Isabella the Catholic dicating her testament. 1864. Oil on canvas. Prado Museum";
    isabel.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    isabel.bottomPadding = 620;
    
    PVImageView *lucrecia = [[PVImageView alloc]init];
    lucrecia.name=@"lucrecia.jpg";
    lucrecia.legend=@"“Muerte de Lucrecia”, 1.871, 257 cm. 347 cm, Óleo sobre lienzo. Museo del Prado";
    lucrecia.legendEN=@"Death of Lucrecia. 1871. Oil on canvas. Prado Museum";
    lucrecia.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page5pinturas = [NSArray arrayWithObjects:comuneros, monje, isabel, lucrecia, nil];
    [self printColumFor:page5pinturas at:page5Scroll withWidth:column5Width atX:60 Y:frame51.size.height+30];
    
    

    // Content of page 6
    page6Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(5*1024, 60, 1024, 655)];
    page6Scroll.contentSize = CGSizeMake(1024,2.5*768);
    page6Scroll.delegate = self;
    page6Scroll.showsVerticalScrollIndicator = NO;
    double page6Offset = 0;
    
    // First Paragraph
    CGRect frame61 = [self.layout regularBlock:250 vOffset:page6Offset];
    [self loadPageContentForPage:9 Section:self.section AtFrame:frame61 OnView:page6Scroll scrolls:NO];
    page6Offset=page6Offset+frame61.size.height+30;

    // Trata de blancas
    PVImageView *trata = [[PVImageView alloc]init];
    trata.name=@"trata.jpg";
    trata.legend=@"“Trata de blancas” 1.894, Óleo sobre lienzo, 166’5 cm. 195 cm, Museo Sorolla, Madrid";
    trata.legendEN=@"Trafficking Human Beigns. 1894. Oil on Canvas. Prado Museum, Madrid";
    trata.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:trata, nil] at:page6Scroll withWidth:600 atX:200 Y:page6Offset];
    page6Offset=page6Offset+floor(trata.frame.size.height)+30;
    
    
    // Second Paragraph
    CGRect frame62 = [self.layout regularBlock:400 vOffset:page6Offset];
    [self loadPageContentForPage:10 Section:self.section AtFrame:frame62 OnView:page6Scroll scrolls:NO];
    page6Offset=page6Offset+frame62.size.height+30;
    
    // Aun dicen
    PVImageView *pescado = [[PVImageView alloc]init];
    pescado.name=@"pescado.jpg";
    pescado.legend=@"“Aún dicen que el pescado es caro” 1.894, Óleo sobre lienzo, 151’5 cm. 204 cm, Museo del Prado, Madrid";
    pescado.legendEN=@"They still say that fish is expensive. 1894. Oil on Canvas. Prado Museum, Madrid";
    pescado.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:pescado, nil] at:page6Scroll withWidth:600 atX:200 Y:page6Offset];
        
    
    // Finalize configuration of scrollview
    [self.scrollview addSubview:page1];
    [self.scrollview addSubview:page2Scroll];
    [self.scrollview addSubview:page3Scroll];
    [self.scrollview addSubview:page4Scroll];
    [self.scrollview addSubview:page5Scroll];
    [self.scrollview addSubview:page6Scroll];

    self.scrollview.contentSize = CGSizeMake(6*1024, 768);
    self.scrollview.delegate = self;
    [self.view addSubview:self.scrollview];
    
    // Finalize configuration of pager
    self.pageControl.numberOfPages = 6;
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
    [tracker set:kGAIScreenName value:@"Romanticismo"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
