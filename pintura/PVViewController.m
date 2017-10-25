//
//  PVViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVViewController.h"
#import "PVPrehistoriaViewController.h"
#import "PVEdadMediaViewController.h"
#import "PVLicenseController.h"
#import "PV.h"
#import <QuartzCore/QuartzCore.h>

@interface PVViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *centuryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *langImage;
@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

@implementation PVViewController
@synthesize descriptionLabel;
@synthesize centuryLabel;

UIImageView *nav1, *nav2, *nav3, *nav4, *nav5, *nav6, *nav7, *nav8, *nav9, *nav10, *nav11, *nav12, *pablito1, *pablito2, *tipInit;
NSArray *navItems;
UIScrollView* mainScrollView;
int currentNavPage = 1;
bool tip1Shown = FALSE;
UITapGestureRecognizer *hideHelpGestureRecognizer;

-(void)viewWillAppear:(BOOL)animated{

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self popUpPablo];
}
- (IBAction)helpIconTap:(id)sender {
    
    NSLog(@"Help icon");
    if (tipInit.alpha<1){
        tipInit.alpha=1;
        [self.view addSubview:tipInit];
        
        [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(removeTip:) userInfo:nil repeats:NO];
    } else {
        [self removeTip:nil];
        
    }

    
}

- (void)removeTip:(id)sender {
    [UIView animateWithDuration:1
                          delay:0
                        options:(UIViewAnimationOptionTransitionNone | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         // Display help
                         tipInit.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         if (finished) [tipInit removeFromSuperview];
                     }];
}


- (void) setMainTitle:(NSString*)lang{
    
    if ([lang isEqual:@"ES"]){
        self.mainTitleLabel.text = @"breve historia de la pintura española";
        self.subTitleLabel.text = @"un paseo anotado";
        self.langImage.image=[UIImage imageNamed:@"EN.png"];
        self.langImage.tag=0;
        tipInit.image = [UIImage imageNamed:@"tip1.png"];
        
    } else {
        self.mainTitleLabel.text = @"brief history of painting in spain";
        self.subTitleLabel.text = @"an annotated walk";
        self.langImage.image=[UIImage imageNamed:@"ES.png"];
        self.langImage.tag=1;
        tipInit.image = [UIImage imageNamed:@"tip1EN.png"];
    }
    
}

- (IBAction)langLabelTap:(id)sender {
    NSLog(@"Label: %i", self.langImage.tag);
    if (self.langImage.tag==0) {
        // Update UI elements
        [self verticalFlipIcon:self.langImage ToModeIcon:@"ES.png"];
        self.langImage.tag=1;
        [[PV sharedInstance] initWithLanguage:@"EN"];
        [self setMainTitle:@"EN"];
        
        // Save preference for next time
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setValue:@"EN" forKey:@"pintura.user.lang"];
        [userDefaults synchronize];
        
    } else {
        // Update UI elements
        [self verticalFlipIcon:self.langImage ToModeIcon:@"EN.png"];
        self.langImage.tag=0;
        [[PV sharedInstance] initWithLanguage:@"ES"];
        [self setMainTitle:@"ES"];
        
        // Save preference for next time
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setValue:@"ES" forKey:@"pintura.user.lang"];
        [userDefaults synchronize];
        
    }
    
    // Update UI
    self.descriptionLabel.text = [[PV sharedInstance] titleOfSection:currentNavPage];
    self.centuryLabel.text = [[PV sharedInstance] centuryOfSection:currentNavPage];
}

- (void) verticalFlipIcon:(UIImageView*)icon ToModeIcon:(NSString*)newMode {
    [UIView transitionWithView:icon duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                           icon.image = [UIImage imageNamed:newMode];
                       } completion:nil];
}

- (void)viewDidLoad {
    
    [self.navigationController setNavigationBarHidden:YES];
    [super viewDidLoad];

    mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 80, 1024, 390)];
    mainScrollView.delegate = self;
    
    // Language preference
    NSString *lang = [[NSUserDefaults standardUserDefaults] stringForKey:@"pintura.user.lang"];
    NSLog(@"Language variable stored for user: %@", lang);
    if ((lang == (id)[NSNull null] || lang.length == 0 )){
        [[PV sharedInstance] initWithLanguage:@"EN"];
        [self setMainTitle:@"EN"];
    } else {
        [[PV sharedInstance] initWithLanguage:lang];
        [self setMainTitle:lang];
    }
        
    // Create navigation menu
    self.descriptionLabel.text = [[PV sharedInstance] titleOfSection:currentNavPage];
    self.centuryLabel.text = [[PV sharedInstance] centuryOfSection:currentNavPage];
    //NSLog(@"Title: %@", self.descriptionLabel.text);
    double tileSize = 380;
    double spacerSize = 60;
    double tileOrigin = spacerSize + tileSize/2 + spacerSize;
    
    nav1 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav1.image =[UIImage imageNamed:@"nav1.jpg"];
    UITapGestureRecognizer *nav1Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav1Tap:)];
    [nav1 addGestureRecognizer:nav1Tap];
    [nav1 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav1];
    
    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav2 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav2.image =[UIImage imageNamed:@"nav2.jpg"];
    UITapGestureRecognizer *nav2Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav2Tap:)];
    [nav2 addGestureRecognizer:nav2Tap];
    [nav2 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav2];

    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav3 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav3.image =[UIImage imageNamed:@"nav3.jpg"];
    UITapGestureRecognizer *nav3Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav3Tap:)];
    [nav3 addGestureRecognizer:nav3Tap];
    [nav3 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav3];
    
    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav4 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav4.image =[UIImage imageNamed:@"nav4.jpg"];
    UITapGestureRecognizer *nav4Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav4Tap:)];
    [nav4 addGestureRecognizer:nav4Tap];
    [nav4 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav4];
    
    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav5 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav5.image =[UIImage imageNamed:@"nav5.jpg"];
    UITapGestureRecognizer *nav5Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav5Tap:)];
    [nav5 addGestureRecognizer:nav5Tap];
    [nav5 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav5];
    
    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav6 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav6.image =[UIImage imageNamed:@"nav6.jpg"];
    UITapGestureRecognizer *nav6Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav6Tap:)];
    [nav6 addGestureRecognizer:nav6Tap];
    [nav6 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav6];
    
    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav7 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav7.image =[UIImage imageNamed:@"nav7.jpg"];
    UITapGestureRecognizer *nav7Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav7Tap:)];
    [nav7 addGestureRecognizer:nav7Tap];
    [nav7 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav7];
    
    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav8 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav8.image =[UIImage imageNamed:@"nav8.jpg"];
    UITapGestureRecognizer *nav8Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav8Tap:)];
    [nav8 addGestureRecognizer:nav8Tap];
    [nav8 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav8];

    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav9 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav9.image =[UIImage imageNamed:@"nav9.jpg"];
    UITapGestureRecognizer *nav9Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav9Tap:)];
    [nav9 addGestureRecognizer:nav9Tap];
    [nav9 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav9];

    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav10 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav10.image =[UIImage imageNamed:@"nav10.jpg"];
    UITapGestureRecognizer *nav10Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav10Tap:)];
    [nav10 addGestureRecognizer:nav10Tap];
    [nav10 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav10];
    
    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav11 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav11.image =[UIImage imageNamed:@"nav11.jpg"];
    UITapGestureRecognizer *nav11Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav11Tap:)];
    [nav11 addGestureRecognizer:nav11Tap];
    [nav11 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav11];
    
    tileOrigin = tileOrigin+tileSize+spacerSize;
    nav12 = [[UIImageView alloc] initWithFrame:CGRectMake(tileOrigin,0,tileSize,tileSize)];
    nav12.image =[UIImage imageNamed:@"nav12.jpg"];
    UITapGestureRecognizer *nav12Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nav12Tap:)];
    [nav12 addGestureRecognizer:nav12Tap];
    [nav12 setUserInteractionEnabled:YES];
    [mainScrollView addSubview:nav12];
    
    mainScrollView.contentSize = CGSizeMake(6000, 390);
    mainScrollView.pagingEnabled = NO;
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.delegate = self;
    [mainScrollView setCanCancelContentTouches:YES];

    [self.view addSubview:mainScrollView];
    
    navItems = [NSArray arrayWithObjects:nav1,nav2,nav3,nav4,nav5,nav6,nav7,nav8,nav9,nav10,nav11,nav12,nil];
    
    
    pablito1 = [[UIImageView alloc]initWithFrame:CGRectMake(150, 800, 172, 223)];
    pablito1.image = [UIImage imageNamed:@"pablito1.png"];
    pablito2 = [[UIImageView alloc]initWithFrame:CGRectMake(150, 800, 172, 223)];
    pablito2.image = [UIImage imageNamed:@"pablito2.png"];
    [pablito1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pintorPirado:)]];
    [pablito1 setUserInteractionEnabled:YES];
    
    
    hideHelpGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tipTap:)];
    
    
    tipInit = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 400*0.8, 200*0.8)];
    if ([[[PV sharedInstance] language] isEqual:@"ES"])tipInit.image = [UIImage imageNamed:@"tip1.png"]; else tipInit.image = [UIImage imageNamed:@"tip1EN.png"];
    [tipInit addGestureRecognizer:hideHelpGestureRecognizer];
    [tipInit setUserInteractionEnabled:YES];
    
    if ([[[PV sharedInstance] language] isEqual:@"ES"]){
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Volver" style:UIBarButtonItemStyleBordered target:nil action:nil]; [[self navigationItem] setBackBarButtonItem:backButton];
    }
    if ([[[PV sharedInstance] language] isEqual:@"EN"]){
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil]; [[self navigationItem] setBackBarButtonItem:backButton];
    }
    
    
    // display help?
    // crear imagenes en windows (desliza la galeria y toca para entrar) (desliza hasta el final) (desliza hacia los lados para pasar pagina) (pulsa aqui para volver a la zona principal) (pulsa en la imagen para aumentar) (un signo indica zonas calientes!)
    // Mostrar automaticamente una vez al arrancar la aplicacion, difuminar en 5 segundos
    // al hacer tap ofrecer "Desactivar sugerencias?
    
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"pintura.user.hideTutorial"] && !tip1Shown){
        
        [self.view addSubview:tipInit];
        tip1Shown = YES;
        [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(removeTip:) userInfo:nil repeats:NO];

    }
    
    // Helper for screenshots
    // [self screenShotHelper];
}

- (void) screenShotHelper {
    self.mainTitleLabel.alpha=0;
    self.subTitleLabel.alpha=0;
    self.langImage.alpha=0;
    self.descriptionLabel.alpha=0;
    self.centuryLabel.alpha=0;  
    
    
}

- (void) popUpPablo {
     
    // aparecer una vez de cada 3
    if ((arc4random() % (3)) == 1) {
     
        [self.view addSubview:pablito1];
    
        [UIView animateWithDuration:1
                     animations:^{
                         // Pop out pablito
                         pablito1.frame = CGRectMake(150, 650, 172, 223);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1
                                               delay:3.0
                                             options:(UIViewAnimationOptionTransitionNone | UIViewAnimationOptionAllowUserInteraction)
                                          animations: ^{
                                              // Pop out pablito
                                              pablito1.frame = CGRectMake(151, 650, 172, 223);
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              pablito1.image = [UIImage imageNamed:@"pablito2.png"];
                                              
                                              [UIView animateWithDuration:3.0
                                                                    delay:3.0
                                                                  options:(UIViewAnimationOptionTransitionNone | UIViewAnimationOptionAllowUserInteraction)
                                                               animations:^{
                                                                   // Pop out pablito
                                                                   pablito1.frame = CGRectMake(150, 650, 172, 223);
                                                               }
                                                                completion:^(BOOL finished) {
                                                                   pablito1.image = [UIImage imageNamed:@"pablito1.png"];
                                                                   [UIView animateWithDuration:2
                                                                                         delay:3.0
                                                                                       options:(UIViewAnimationOptionTransitionNone | UIViewAnimationOptionAllowUserInteraction)
                                                                                    animations:^{
                                                                                        
                                                                                        // Hide pablito
                                                                                        pablito1.frame = CGRectMake(150, 800, 172, 223);
                                                                                    } completion:^(BOOL finished) {
                                                                                        
                                                                                        
                                                                                        
                                                                                    }];
                                                                   
                                                                   
                                                               }];
                                          }];
                         
                         
                     }];
     }
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    int page = floor((mainScrollView.contentOffset.x+220) / 440)+1;
    int offset = fmod(mainScrollView.contentOffset.x+220,440);
    
    //NSLog(@"Offset: %i Floor: %f Page: %d", offset, floor((mainScrollView.contentOffset.x) / 440), page);
    
    if (currentNavPage != page && page >= 1){
        currentNavPage = page;
        self.descriptionLabel.text = [[PV sharedInstance] titleOfSection:page];
        self.centuryLabel.text = [[PV sharedInstance] centuryOfSection:page];
    } 
    
    //UIImageView *navElement = navItems[page-1];
    
    
    
    if (offset<50){
        [self.descriptionLabel setAlpha: offset/50];
        //int propOffset = 1.3 - 0.3*offset/50;
        //navElement.transform = CGAffineTransformScale(CGAffineTransformIdentity, propOffset, propOffset);
        //NSLog(@"Left offse prop: %i", propOffset);
    } else if (offset >50 && offset < (440-50)){
        [self.descriptionLabel setAlpha: 1];
        //navElement.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.3, 1.3);
    } else if (offset>(440-50)){
        [self.descriptionLabel setAlpha: offset/390];
        //int propOffset = 1.3 - 0.3*offset/390;
        //navElement.transform = CGAffineTransformScale(CGAffineTransformIdentity, propOffset, propOffset);
        //NSLog(@"Right offse prop: %i", propOffset);
    }
    
    
    
    
    
    
}

- (void)viewDidUnload {
    [self setDescriptionLabel:nil];
    [self setCenturyLabel:nil];
    [self setMainTitleLabel:nil];
    [self setSubTitleLabel:nil];
    [self setLangImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSLog(@"Segue: %@", segue.identifier);
    if ([[[PV sharedInstance] language] isEqual:@"ES"]){
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Volver" style:UIBarButtonItemStyleBordered target:nil action:nil];
        self.navigationItem.BackBarButtonItem =backButton;
    }
    
    if ([[[PV sharedInstance] language] isEqual:@"EN"]){
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
        self.navigationItem.BackBarButtonItem=backButton;
    }
    
    if ([segue.identifier isEqualToString:@"by"]||[segue.identifier isEqualToString:@"license"]) {
        PVLicenseController *destViewController = segue.destinationViewController;
        destViewController.mode = segue.identifier;

    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


//The event handling method
- (void)nav1Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap1");
    [self performSegueWithIdentifier:@"prehistoria" sender:self];
}
- (void)nav2Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap2");
    [self performSegueWithIdentifier:@"edadMedia" sender:self];
}
- (void)nav3Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap3");
    [self performSegueWithIdentifier:@"romanico" sender:self];
}
- (void)nav4Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap4");
    [self performSegueWithIdentifier:@"gotico" sender:self];
}
- (void)nav5Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap5");
    [self performSegueWithIdentifier:@"renacimiento" sender:self];
}
- (void)nav6Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap6");
    [self performSegueWithIdentifier:@"manierismo" sender:self];
}
- (void)nav7Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap7");
    [self performSegueWithIdentifier:@"barroco" sender:self];
}
- (void)nav8Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap8");
    [self performSegueWithIdentifier:@"goya" sender:self];
}
- (void)nav9Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap9");
    [self performSegueWithIdentifier:@"roman" sender:self];
}
- (void)nav10Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap10");
    [self performSegueWithIdentifier:@"veinte" sender:self];
}
- (void)nav11Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap11");
    [self performSegueWithIdentifier:@"picasso" sender:self];
}
- (void)nav12Tap:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Tap12");
    [self performSegueWithIdentifier:@"actual" sender:self];
}
- (void)pintorPirado:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"Pintor Pirado");
    [self performSegueWithIdentifier:@"pintorpirado" sender:self];
}

- (void)tipTap:(UITapGestureRecognizer *)recognizer {
    

}
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 0) {
        
    } else {
        [tipInit removeFromSuperview];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setBool:YES forKey:@"pintura.user.hideTutorial"];
        [userDefaults synchronize];
    }
}



@end
