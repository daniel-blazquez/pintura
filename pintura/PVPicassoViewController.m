//
//  PVPicassoViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 10/21/12.
//
//

#import "PVPicassoViewController.h"
#import "PVLayoutServer.h"
#import "PV.h"
#import "PVImageView.h"

@interface PVPicassoViewController ()
@end

PVImageView *guitarrista, *demoiselles, *mandolina, *hermana, *volatineros, *pernod, *guernica, *guerra, *pablo, *meninas;
UIView *page1,*page2, *page3,*page4, *page5,*page6;
UIScrollView *page2Scroll, *page3Scroll, *page4Scroll, *page5Scroll, *page6Scroll, *page7Scroll;

@implementation PVPicassoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    //NSLog(@"Picasso View Controller viewDidLoad");
    self.section = 11;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2, Azul y rosa
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 655)];
    page2Scroll.contentSize = CGSizeMake(1024,2.3*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    double page2Offset = 0;
    
    // First Paragraph
    double columnWidth = 300;
    CGRect frame21 = [self.layout rightBlock:500 offset:page2Offset leftOffset:columnWidth];;
    [self loadPageContentForPage:2 Section:self.section AtFrame:frame21 OnView:page2Scroll scrolls:NO];

    // Hermana
    PVImageView *hermana = [[PVImageView alloc]init];
    hermana.name=@"hermana.jpg";
    hermana.legend=@"“Hermana del artista”, 1.899, Carboncillo y lápices de color sobre papel, 44 cm. 29 cm. Museo Picasso, Barcelona";
    hermana.legendEN=@"The Artist's Sister Lola. 1899. Charcoal and crayon. Picasso Museum, Barcelona";
    hermana.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:hermana, nil] at:page2Scroll withWidth:columnWidth atX:60 Y:0];
  
    // Second Paragraph
    columnWidth = 270;
    page2Offset+=frame21.size.height;
    CGRect frame22 = [self.layout rightBlock:600 offset:page2Offset leftOffset:columnWidth];
    [self loadPageContentForPage:3 Section:self.section AtFrame:frame22 OnView:page2Scroll scrolls:NO];
    
    // Guitarrista
    PVImageView *guitarrista = [[PVImageView alloc]init];
    guitarrista.name=@"guitarrista.jpg";
    guitarrista.legend=@"“El guitarrista ciego”, 1.903, Óleo sobre tabla,121 cm.82cm. Art Institute, Colección Bartlett, Chicago (Estados Unidos)";
    guitarrista.legendEN=@"The Old Guitarist. 1903. Oil on panel. Art Institute of Chicago";
    guitarrista.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:guitarrista, nil] at:page2Scroll withWidth:columnWidth atX:60 Y:page2Offset];
    
    // Third Paragraph
    columnWidth = 400;
    page2Offset+=frame22.size.height+30;
    CGRect frame23 = [self.layout rightBlock:600 offset:page2Offset leftOffset:columnWidth];
    [self loadPageContentForPage:4 Section:self.section AtFrame:frame23 OnView:page2Scroll scrolls:NO];


    // Volatineros
    // Guitarrista
    PVImageView *volatineros = [[PVImageView alloc]init];
    volatineros.name=@"volatineros.jpg";
    volatineros.legend=@"“Los Volatineros”, 1.909, Óleo sobre lienzo, 92 cm. 73 cm, Ermitage, San Petersburgo, (Federación Rusa)";
    volatineros.legendEN=@"Family of Acrobats (jugglers). 1909. Oil on canvas. Ermitage Collection, Saint Petesburg";
    volatineros.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:volatineros, nil] at:page2Scroll withWidth:columnWidth atX:60 Y:page2Offset];
    
    
    // Content of page 3, Cubismo
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,3*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    double page3Offset = 0;

    
    // First Paragraph
    CGRect frame31 = [self.layout regularBlock:330 vOffset:0];
    [self loadPageContentForPage:5 Section:self.section AtFrame:frame31 OnView:page3Scroll scrolls:NO];
    page3Offset+=frame31.size.height;
    
    // Second Paragraph
    columnWidth = 300;
    CGRect frame32 = [self.layout rightBlock:600 offset:page3Offset leftOffset:columnWidth];
    [self loadPageContentForPage:6 Section:self.section AtFrame:frame32 OnView:page3Scroll scrolls:NO];

    // demoiselles
    PVImageView *demoiselles = [[PVImageView alloc]init];
    demoiselles.name=@"demoiselles.jpg";
    demoiselles.legend=@"“Les demoiselles D’Avignon”, 1.907, Óleo sobre lienzo. 245 cm. 235 cm. Museum of Modern Art, Nueva York (Estados Unidos)";
    demoiselles.legendEN=@"Les Demoiselles d'Avignon (The Young Ladies of Avignon). 1907. Oil on canvas. Museum of Modern Art, New York";
    demoiselles.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:demoiselles, nil] at:page3Scroll withWidth:columnWidth atX:60 Y:page3Offset];
    
    
    // Third Paragraph
    page3Offset+=frame32.size.height;
    columnWidth = 400;
    CGRect frame33 = [self.layout rightBlock:600 offset:page3Offset leftOffset:columnWidth];
    [self loadPageContentForPage:7 Section:self.section AtFrame:frame33 OnView:page3Scroll scrolls:NO];
    
    // Mandolina
    PVImageView *mandolina = [[PVImageView alloc]init];
    mandolina.name=@"mandolina.jpg";
    mandolina.legend=@"“Mujer con mandolina”, 1.909, Óleo sobre lienzo, 92 cm. 73 cm, Ermitage, San Petersburgo, (Federación Rusa)";
    mandolina.legendEN=@"Girl with a Mandoline. 1909. Oil on canvas. Ermitage Collection, Saint Petesburg";
    mandolina.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:mandolina, nil] at:page3Scroll withWidth:columnWidth atX:60 Y:page3Offset];

    
    // Fourth Paragraph
    page3Offset+=frame33.size.height;
    columnWidth = 350;
    CGRect frame34 = [self.layout rightBlock:600 offset:page3Offset leftOffset:columnWidth];
    [self loadPageContentForPage:8 Section:self.section AtFrame:frame34 OnView:page3Scroll scrolls:NO];
    
    // Pernod
    PVImageView *pernod = [[PVImageView alloc]init];
    pernod.name=@"pernod.jpg";
    pernod.legend=@"“Botella de pernod y vaso, 1.912, Óleo sobre lienzo, 44’5 cm. 32’5 cm. Ermitage, San Petersburgo (Federación Rusa)";
    pernod.legendEN=@"Table in a Cafe (Bottle of Pernod). 1912. Oil on canvas. Ermitage Collection, Saint Petesburg";
    pernod.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:pernod, nil] at:page3Scroll withWidth:columnWidth atX:60 Y:page3Offset];
    
    
    
    // Content of page 4, Clasicismo
    page4Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(3*1024, 60, 1024, 655)];
    page4Scroll.contentSize = CGSizeMake(1024,2.1*768);
    page4Scroll.delegate = self;
    page4Scroll.showsVerticalScrollIndicator = NO;
    double page4Offset = 0;
    
    
    // First Paragraph
    CGRect frame41 = [self.layout regularBlock:200 vOffset:0];
    [self loadPageContentForPage:9 Section:self.section AtFrame:frame41 OnView:page4Scroll scrolls:NO];
    page4Offset+=frame41.size.height;
    
    // Second Paragraph
    columnWidth = 300;
    CGRect frame42 = [self.layout rightBlock:1300 offset:page4Offset leftOffset:columnWidth];
    [self loadPageContentForPage:10 Section:self.section AtFrame:frame42 OnView:page4Scroll scrolls:NO];
    
    // Column of images
    PVImageView *maternite = [[PVImageView alloc]init];
    maternite.name=@"maternite.jpg";
    maternite.legend=@"“Madre y niño” o “Maternité”, 1.921, Óleo sobre lienzo, 143 cm. 162 cm, Art Institute, Chicago (Estados Unidos)";
    maternite.legendEN=@"Maternité. 1921. Oil on canvas. Art Institute, Chicago";
    maternite.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    maternite.bottomPadding = 0;
    
    PVImageView *tres = [[PVImageView alloc]init];
    tres.name=@"tres.jpg";
    tres.legend=@"“Tres mujeres en la fuente”, 1.921, Óleo sobre lienzo, 204 cm. 174 cm. Museum of Modern Art, Nueva Cork (Estados Unidos)";
    tres.legendEN=@"Three Women at the Spring. 1921. Oil on canvas. Museum of Modern Art, New Cork";
    tres.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    tres.bottomPadding = 0;
    
    PVImageView *amantes = [[PVImageView alloc]init];
    amantes.name=@"amantes.jpg";
    amantes.legend=@"“Los Amantes”, 1.923, Óleo sobre lienzo, 130cm. 97 cm, National Gallery, Washington, (Estados Unidos)";
    amantes.legendEN=@"The Lovers. 1923. Oil on canvas. National Gallery, Washington";
    amantes.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    amantes.bottomPadding = 0;
    
    NSArray *page4pinturas = [NSArray arrayWithObjects:maternite, tres, amantes, nil];
    [self printColumFor:page4pinturas at:page4Scroll withWidth:columnWidth atX:60 Y:page4Offset];
    
    // Content of page 5, Surrealismo
    page5Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(4*1024, 60, 1024, 655)];
    page5Scroll.contentSize = CGSizeMake(1024,1.5*768);
    page5Scroll.delegate = self;
    page5Scroll.showsVerticalScrollIndicator = NO;
    double page5Offset = 0;
    
    // First Paragraph
    CGRect frame51 = [self.layout regularBlock:150 vOffset:0];
    [self loadPageContentForPage:11 Section:self.section AtFrame:frame51 OnView:page5Scroll scrolls:NO];
    page5Offset+=frame51.size.height;
    
    // Guernica
    columnWidth=600;
    PVImageView *guernica = [[PVImageView alloc]init];
    guernica.name=@"guernica.jpg";
    guernica.legend=@"“Guernica”, 1.937, Óleo sobre lienzo, 351 cm. 782 cm, Museo Nacional Centro de Arte “Reina Sofía”, Madrid";
    guernica.legendEN=@"Guernica. 1937. Oil on canvas. Reina Sofia National Museum of Art, Madrid";
    guernica.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:guernica, nil] at:page5Scroll withWidth:columnWidth atX:180 Y:page5Offset];

    
    // Second Paragraph
    page5Offset=page5Offset+guernica.frame.size.height+60;
    CGRect frame52 = [self.layout regularBlock:500 vOffset:page5Offset];
    [self loadPageContentForPage:12 Section:self.section AtFrame:frame52 OnView:page5Scroll scrolls:NO];
    
    // Content of page 6, Postguerra
    page6Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(5*1024, 60, 1024, 655)];
    page6Scroll.contentSize = CGSizeMake(1024,2.2*768);
    page6Scroll.delegate = self;
    page6Scroll.showsVerticalScrollIndicator = NO;
    double page6Offset = 0;
    
    // First Paragraph
    CGRect frame61 = [self.layout regularBlock:230 vOffset:0];
    [self loadPageContentForPage:13 Section:self.section AtFrame:frame61 OnView:page6Scroll scrolls:NO];
    page6Offset=page6Offset+frame61.size.height;
    
    // Guerra
    columnWidth=600;
    
    PVImageView *guerra = [[PVImageView alloc]init];
    guerra.name=@"guerra.jpg";
    guerra.legend=@"“La guerra”, 1.952, Óleo sobre isorel, 470 cm. 1.020 cm. Templo de la Paz, Vallauris";
    guerra.legendEN=@"The War. 1952. Oil on canvas. Templo de la Paz, Vallauris";
    guerra.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:guerra, nil] at:page6Scroll withWidth:columnWidth atX:180 Y:page6Offset];
    
    // Second Paragraph
    page6Offset=page6Offset+guerra.frame.size.height+60;
    CGRect frame62 = [self.layout regularBlock:300 vOffset:page6Offset];
    [self loadPageContentForPage:14 Section:self.section AtFrame:frame62 OnView:page6Scroll scrolls:NO];

    
    // Meninas
    columnWidth=400;
    page6Offset=page6Offset+frame62.size.height;
    
    PVImageView *meninas = [[PVImageView alloc]init];
    meninas.name=@"meninasp.jpg";
    meninas.legend=@"Las Meninas (de Velázquez), 1.957, 194 cm. 260 cm. Óleo sobre lienzo. Museo Picasso, Barcelona (España)";
    meninas.legendEN=@"The Meninas. 1957. Oil on canvas. Picasso Museum, Barcelona";
    meninas.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:meninas, nil] at:page6Scroll withWidth:columnWidth atX:60 Y:page6Offset];
    
    // Third Paragraph
    CGRect frame63 = [self.layout rightBlock:800 offset:page6Offset leftOffset:columnWidth];
    [self loadPageContentForPage:15 Section:self.section AtFrame:frame63 OnView:page6Scroll scrolls:NO];
    

    // Content of page 7, Pablo Picasso
    page7Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(6*1024, 60, 1024, 655)];
    page7Scroll.contentSize = CGSizeMake(1024,1*768);
    page7Scroll.delegate = self;
    page7Scroll.showsVerticalScrollIndicator = NO;
    double page7Offset = 0;
    
    // First Paragraph
    columnWidth=450;
    CGRect frame71 = [self.layout rightBlock:400 offset:page7Offset leftOffset:columnWidth];
    [self loadPageContentForPage:16 Section:self.section AtFrame:frame71 OnView:page7Scroll scrolls:NO];

    
    // Pablo
    PVImageView *pablo = [[PVImageView alloc]init];
    pablo.name=@"pablo.jpg";
    pablo.legend=@"“Autorretrato”, 1907, Óleo sobre lienzo, 50 cm. 60 cm, Narodni Galerie, Praga (República Checa)";
    pablo.legendEN=@"Selfportrait. 1907. Narodni Galerie, Prague";
    pablo.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    [self printColumFor:[NSArray arrayWithObjects:pablo, nil] at:page7Scroll withWidth:columnWidth atX:60 Y:page7Offset];

    
    
    // Finalize configuration of scrollview
    [self.scrollview addSubview:page1];
    [self.scrollview addSubview:page2Scroll];
    [self.scrollview addSubview:page3Scroll];
    [self.scrollview addSubview:page4Scroll];
    [self.scrollview addSubview:page5Scroll];
    [self.scrollview addSubview:page6Scroll];
    [self.scrollview addSubview:page7Scroll];
    
    self.scrollview.contentSize = CGSizeMake(7*1024, 768);
    self.scrollview.delegate = self;
    [self.view addSubview:self.scrollview];
    
    // Finalize configuration of pager
    self.pageControl.numberOfPages = 7;
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
    [tracker set:kGAIScreenName value:@"Picasso"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end

