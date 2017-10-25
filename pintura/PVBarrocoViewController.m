//
//  PVBarrocoViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVBarrocoViewController.h"
#import "PVImageView.h"
#import "PV.h"

@interface PVBarrocoViewController ()

@end

@implementation PVBarrocoViewController

UIView *page1,*page2, *page3, *page4, *page5;
UIScrollView *page2Scroll, *page3Scroll, *page4Scroll, *page5Scroll, *page6Scroll, *page7Scroll;
    
- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"Barroco View Controller viewDidLoad");
    self.section = 7;
    
    // Title
    [self displayTitleOfPage:1 AtSection:self.section InView:self.scrollview];
    
    // Content of page 1
    page1 = [[UIView alloc] initWithFrame:self.p1Frame];
    [self loadPageContentForPage:1 Section:self.section AtFrame:[self.layout introductionLayout] OnView:page1 scrolls:YES];
    
    // Content of page 2 -  Murillo
    page2Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(1024, 60, 1024, 655)];
    page2Scroll.contentSize = CGSizeMake(1024,2.5*768);
    page2Scroll.delegate = self;
    page2Scroll.showsVerticalScrollIndicator = NO;
    
    
    
    PVImageView *pajarito = [[PVImageView alloc]init];
    pajarito.name=@"pajarito.jpg";
    pajarito.legend=@"La Sagrada Familia del pajarito” (1.650). 188 cm. 144cm. Óleo sobre lienzo. Museo del Prado (Madrid))";
    pajarito.legendEN=@"The Holy Family with a Little Bird (1650) 188 cm. 144cm. Oil on canvas. Museo del Prado (Madrid)";
    pajarito.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    
    
    PVImageView *adoracion = [[PVImageView alloc]init];
    adoracion.name=@"adoracion.jpg";
    adoracion.legend=@"Adoración de los Pastores” (1.650-55) 228cm. 187cm. Óleo sobre lienzo. Museo del Prado (Madrid)";
    adoracion.legendEN=@"Adoración de los Pastores” (1.650-55) 228cm. 187cm. Óleo sobre lienzo. Museo del Prado (Madrid)";
    adoracion.link=@"http://clio.rediris.es/fichas_arte/la_adoracion.htm";
    adoracion.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    
    NSArray *page2apinturas = [NSArray arrayWithObjects:pajarito,adoracion, nil];
    [self printRowFor:page2apinturas at:page2Scroll withHeight:250 atX:120 Y:0];
    
    // First paragraph
    double page2Offset = 280;
    CGRect frame2 = [self.layout regularBlock:500 vOffset:page2Offset];
    [self loadPageContentForPage:2 Section:self.section AtFrame:frame2 OnView:page2Scroll scrolls:NO];
    page2Offset+=frame2.size.height;
    
    // Second paragraph
    CGRect frame21 = [self.layout rightBlock:800 offset:page2Offset leftOffset:300];
    [self loadPageContentForPage:3 Section:self.section AtFrame:frame21 OnView:page2Scroll scrolls:NO];

    // Column of images
    PVImageView *fruta = [[PVImageView alloc]init];
    fruta.name=@"fruta.jpg";
    fruta.legend=@"Niños comiendo fruta” (1.650) Óleo sobre lienzo. Alte Pinakotherk (Munich)";
    fruta.legendEN=@"Two Children Eating a Melon and Grapes” (1.650) Oil on canvas. Alte Pinakotherk (Munich)";
    fruta.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    fruta.link = @"http://es.m.wikipedia.org/wiki/Ni%C3%B1os_comiendo_uvas_y_mel%C3%B3n";
    
    PVImageView *inma = [[PVImageView alloc]init];
    inma.name=@"inma.jpg";
    inma.legend=@"“La Inmaculada de Soult” (1.678) 220 cm. 118cm. Óleo sobre lienzo. Museo del Prado (Madrid)";
    inma.legendEN=@"“The Immaculate Conception of the Venerable Ones, or of Soult” (1.678) 220 cm. 118cm. Oil on canvas. Museo del Prado (Madrid)";
    inma.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    inma.link = @"http://es.m.wikipedia.org/wiki/Inmaculada_de_Soult";
    
    NSArray *page2pinturas = [NSArray arrayWithObjects:fruta, inma, nil];
    [self printColumFor:page2pinturas at:page2Scroll withWidth:300 atX:60 Y:page2Offset];
    
    
    // Content of page 3 - Zurbaran
    page3Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(2*1024, 60, 1024, 655)];
    page3Scroll.contentSize = CGSizeMake(1024,2.5*768);
    page3Scroll.delegate = self;
    page3Scroll.showsVerticalScrollIndicator = NO;
    double page3Offset = 0;
    double leftOffset = 300;
    
    CGRect frame3 = [self.layout regularBlock:540 vOffset:page3Offset];
    [self loadPageContentForPage:4 Section:self.section AtFrame:frame3 OnView:page3Scroll scrolls:NO];
    page3Offset+=frame3.size.height;
    
    CGRect frame31 = [self.layout rightBlock:800 offset:page3Offset leftOffset:leftOffset];
    [self loadPageContentForPage:5 Section:self.section AtFrame:frame31 OnView:page3Scroll scrolls:NO];
    
    // Column of images
    PVImageView *sanhugo = [[PVImageView alloc]init];
    sanhugo.name=@"sanhugo.jpg";
    sanhugo.legend=@"San Hugo en el refectorio de los Cartujos, (1.633) 168 cm. 102cm. Óleo sobre lienzo. Museo de Bellas Artes (Sevilla)";
    sanhugo.legendEN=@"St Hugh in the Refectory, (1.633) 168 cm. 102cm. Oil on canvas. Museo de Bellas Artes (Sevilla)";
    sanhugo.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    sanhugo.link = @"http://es.m.wikipedia.org/wiki/San_Hugo_en_el_refectorio_de_los_Cartujos";
    sanhugo.bottomPadding = 120;
    
    PVImageView *casilda = [[PVImageView alloc]init];
    casilda.name=@"casilda.jpg";
    casilda.legend=@"“Santa Casilda” (1.638-42) 184 cm. 0’90 cm. Óleo sobre lienzo. Museo Thyssen-Bornemisza, Madrid";
    casilda.legendEN=@"“Saint Casilda” (1.638-42) 184 cm. 0’90 cm. Oil on canvas. Museo Thyssen-Bornemisza, Madrid";
    casilda.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    casilda.link = @"http://www.museothyssen.org/thyssen/ficha_obra/65";
    
    NSArray *page3pinturas = [NSArray arrayWithObjects:sanhugo, casilda, nil];
    [self printColumFor:page3pinturas at:page3Scroll withWidth:leftOffset atX:60 Y:page3Offset];
    
    
    // Content of page 4 - Velázquez 1
    page4Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(3*1024,60, 1024, 655)];
    page4Scroll.contentSize = CGSizeMake(1024,2*768);
    page4Scroll.delegate = self;
    page4Scroll.showsVerticalScrollIndicator = NO;
    double page4Offset = 0;
    double column4Width = 400;
    
    // First Paragraph
    CGRect frame41 = [self.layout regularBlock:400 vOffset:page4Offset];
    [self loadPageContentForPage:6 Section:self.section AtFrame:frame41 OnView:page4Scroll scrolls:NO];
    page4Offset+=frame41.size.height;
    
    // Second Paragraph
    CGRect frame42 = [self.layout rightBlock:1000 offset:frame41.size.height leftOffset:column4Width];
    [self loadPageContentForPage:7 Section:self.section AtFrame:frame42 OnView:page4Scroll scrolls:NO];
    
    // Column of images
    PVImageView *vieja = [[PVImageView alloc]init];
    vieja.name=@"vieja.jpg";
    vieja.legend=@"“Vieja friendo huevos”. (1.618). 128cm. 99 cm. Óleo sobre lienzo. National Gallery of Scotland (Edinburgo)";
    vieja.legendEN=@"“Old Woman Frying Eggs”. (1.618). 128cm. 99 cm. Oil on canvas. National Gallery of Scotland (Edinburgo)";
    vieja.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    vieja.link = @"http://es.m.wikipedia.org/wiki/Vieja_friendo_huevos";
    vieja.linkEN = @"http://en.m.wikipedia.org/wiki/Old_Woman_Frying_Eggs";
    vieja.bottomPadding = 150;
    
    PVImageView *baco = [[PVImageView alloc]init];
    baco.name=@"baco.jpg";
    baco.legend=@"“El Triunfo de Baco”, 1.628-29 222 cm. 165 cm. Óleo sobre lienzo. Museo del Prado (Madrid)";
    baco.legendEN=@"“The Triumph of Bacchus”, 1.628-29 222 cm. 165 cm. Oil on canvas. Museo del Prado (Madrid)";
    baco.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    baco.link = @"http://es.m.wikipedia.org/wiki/El_triunfo_de_Baco_(Vel%C3%A1zquez)";
    baco.linkEN = @"http://en.m.wikipedia.org/wiki/The_Triumph_of_Bacchus";
    NSArray *page4pinturas = [NSArray arrayWithObjects:vieja, baco, nil];
    [self printColumFor:page4pinturas at:page4Scroll withWidth:column4Width atX:60 Y:page4Offset];
    

    
    // Content of page 5 - Velázquez 2 - Madrid
    page5Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(4*1024, 60, 1024, 655)];
    page5Scroll.contentSize = CGSizeMake(1024,2*768);
    page5Scroll.delegate = self;
    page5Scroll.showsVerticalScrollIndicator = NO;
    double page5Offset = 1;
    double column5Width = 400;
    
    // Right column
    CGRect frame51 = [self.layout rightBlock:1500 offset:page5Offset leftOffset:column5Width];
    [self loadPageContentForPage:8 Section:self.section AtFrame:frame51 OnView:page5Scroll scrolls:NO];
    
    // Column of images
    PVImageView *fragua = [[PVImageView alloc]init];
    fragua.name=@"fragua.jpg";
    fragua.legend=@"“La Fragua de Vulcano”, 1.630. 290 cm. 223 cm. Óleo sobre lienzo. Museo del Prado";
    fragua.legendEN=@"“Apollo in the Forge of Vulcan”, 1.630. 290 cm. 223 cm. Oil on canvas. Museo del Prado";
    fragua.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    fragua.link = @"http://es.m.wikipedia.org/wiki/La_fragua_de_Vulcano";
    fragua.linkEN = @"http://en.m.wikipedia.org/wiki/Apollo_in_the_Forge_of_Vulcan";
    
    PVImageView *lanzas = [[PVImageView alloc]init];
    lanzas.name=@"lanzas.jpg";
    lanzas.legend=@"“La Rendición de Breda”, 1.634-35 367 cm. 307 cm. Óleo sobre lienzo. Museo del Prado";
    lanzas.legendEN=@"“The Surrender of Breda”, 1.634-35 367 cm. 307 cm. Oil on canvas. Museo del Prado";
    lanzas.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    lanzas.link = @"http://es.m.wikipedia.org/wiki/La_rendici%C3%B3n_de_Breda";
    lanzas.linkEN = @"http://en.m.wikipedia.org/wiki/The_Surrender_of_Breda";
    lanzas.bottomPadding = 140;

    PVImageView *espejo = [[PVImageView alloc]init];
    espejo.name=@"espejo.jpg";
    espejo.legend=@"“La Venus del Espejo”, 1.649-51 177 cm. 123 cm. Óleo sobre lienzo. National Gallery (Londres)";
    espejo.legendEN=@"“Rokeby Venus”, 1.649-51 177 cm. 123 cm. Óleo sobre lienzo. National Gallery (Londres)";
    espejo.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageSingleTap:)];
    espejo.link = @"http://es.m.wikipedia.org/wiki/Venus_del_espejo";
    espejo.linkEN = @"http://en.m.wikipedia.org/wiki/Rokeby_Venus";
    
    NSArray *page5pinturas = [NSArray arrayWithObjects:fragua, lanzas, espejo, nil];
    [self printColumFor:page5pinturas at:page5Scroll withWidth:column5Width atX:60 Y:page5Offset];
    
    
    // Content of page 6 - Velázquez 3 - Las Meninas
    page6Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(5*1024, 60, 1024, 655)];
    page6Scroll.contentSize = CGSizeMake(1024,1.5*768);
    page6Scroll.delegate = self;
    page6Scroll.showsVerticalScrollIndicator = NO;
    double page6Offset = 1;
    double column6Width = 400;
    
    // Right column
    CGRect frame61 = [self.layout rightBlock:800 offset:page6Offset leftOffset:column6Width];
    [self loadPageContentForPage:9 Section:self.section AtFrame:frame61 OnView:page6Scroll scrolls:NO];
    
    // Column of images
    PVImageView *meninas = [[PVImageView alloc]init];
    meninas.name=@"meninas.jpg";
    meninas.legend=@"“Las Meninas”, 1.656-57 318 cm. 276 cm. Óleo sobre lienzo. Museo del Prado (Madrid)";
    meninas.legendEN=@"“Las Meninas”, 1.656-57 318 cm. 276 cm. Oil on canvas. Museo del Prado (Madrid)";
    meninas.recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleInteractiveSingleTap:)];
    meninas.link = @"http://es.m.wikipedia.org/wiki/Las_Meninas";
    meninas.linkEN = @"http://en.m.wikipedia.org/wiki/Las_Meninas";
    
    NSArray *page6pinturas = [NSArray arrayWithObjects:meninas, nil];
    [self printColumFor:page6pinturas at:page6Scroll withWidth:column6Width atX:60 Y:page6Offset];

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


//The event handling method
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Barroco"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end

