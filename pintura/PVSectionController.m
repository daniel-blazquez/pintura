//
//  PVSectionController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVSectionController.h"
#import "PVTimelineView.h"
#import "PVInteractiveImageViewController.h"
#import "PV.h"
#import <QuartzCore/QuartzCore.h>
#import "PVWikiController.h"
#import "PVUIButton.h"
#import "PVImageView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface PVSectionController ()

@end


@implementation PVSectionController

@synthesize scrollview=scrollview_;
@synthesize pageControl=pageControl_;
@synthesize path=path_;
@synthesize baseURL=baseURL_;
@synthesize pageHeader=pageHeader_;
@synthesize p1Frame=p1Frame_;
@synthesize p2Frame=p2Frame_;
@synthesize p3Frame=p3Frame_;
@synthesize p4Frame=p4Frame_;
@synthesize p5Frame=p5Frame_;
@synthesize p6Frame=p6Frame_;
@synthesize p7Frame=p7Frame_;
@synthesize p8Frame=p8Frame_;
@synthesize curtain=_curtain;
@synthesize subTitle1=_subTitle1;
@synthesize section=_section;
@synthesize imageSegue=_imageSegue;
@synthesize imageSegueTitle=_imageSegueTitle;
@synthesize layout=_layout;

- (PVLayoutServer *) layout {
    if (!_layout){
        _layout = [[PVLayoutServer alloc] init];
    }
    return _layout;
}


CGRect initialFrameAux;
NSString *linkSegue;
UIImageView *imageAux;
UILabel *title;
UIView *handleSingleTapViewBox;
UILabel *legendLabel;
bool timelinevisible = NO;
PVTimelineView *timelineView;
UIImageView *arrow, *tip1, *tip2, *tip3, *tip4, *helpIcon;
bool showingImageDetal = NO;
bool tip2Shown = NO;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)hideBar:(id)sender {
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(hideBar:) userInfo:nil repeats:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
	// Top level scrollview
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];  
    self.scrollview.pagingEnabled = YES;
    self.scrollview.clipsToBounds = NO;
    self.scrollview.showsHorizontalScrollIndicator = YES;
    
    // Curtain for images FX
    self.curtain = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1023, 768)];
    self.curtain.alpha = 0;
    self.curtain.hidden = YES;
    self.curtain.backgroundColor = [UIColor grayColor];
    self.curtain.userInteractionEnabled = NO;

    // Create frames for pages
    self.p1Frame = CGRectMake(0, 60, 1024, 655);
    self.p2Frame = CGRectMake(1024, 60, 1024, 708);
    self.p3Frame = CGRectMake(2*1024, 60, 1024, 708);
    self.p4Frame = CGRectMake(3*1024, 60, 1024, 708);
    self.p5Frame = CGRectMake(4*1024, 60, 1024, 708);
    self.p6Frame = CGRectMake(5*1024, 60, 1024, 708);
    self.p7Frame = CGRectMake(6*1024, 60, 1024, 708);
    self.p8Frame = CGRectMake(7*1024, 60, 1024, 708);
    
    // Navigation
    
    NSMutableArray *navigation = [[NSMutableArray alloc] initWithCapacity:2];
    
    NSString *nextLabel = @"Siguiente";
    NSString *prevLabel = @"Anterior";
    
    if ([[[PV sharedInstance] language] isEqual:@"EN"]){
        nextLabel = @"Next";
        prevLabel = @"Previous";
    }
    
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc]
                                   initWithTitle:nextLabel
                                   style:UIBarButtonItemStyleBordered 
                                   target:self
                                   action:@selector(nextPage)];
    
    UIBarButtonItem *prevButton = [[UIBarButtonItem alloc] 
                                   initWithTitle:prevLabel
                                   style:UIBarButtonItemStyleBordered 
                                   target:self 
                                   action:@selector(prevPage)];
    [navigation addObject:nextButton];
    [navigation addObject:prevButton];
    self.navigationItem.rightBarButtonItems = navigation;

    // Pager
    CGRect f = CGRectMake(487,768-30,120,30);
    self.pageControl = [[PageControl alloc] initWithFrame:f];
    self.pageControl.dotColorCurrentPage = [UIColor grayColor];
    self.pageControl.currentPage = 0;
    
    // Timeline
    timelineView = [[PVTimelineView alloc] initWithFrame:CGRectMake(0, 60, 200, 800)];
    [timelineView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleTimeline:)]];
    timelineView.userInteractionEnabled = YES;
    
    // Resources
    self.path = [[NSBundle mainBundle] bundlePath];
    self.baseURL = [NSURL fileURLWithPath:self.path];
    self.pageHeader = @"<head><link href=\"default.css\"; rel=\"stylesheet\" type=\"text/css\" /></head<body>";
    
    // Titulo
    self.subTitle1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 500, 50)];
    UIFont *font = [UIFont fontWithName:@"OFL Sorts Mill Goudy TT" size:35];
    self.subTitle1.textColor = [self colorWithHexString:@"8C8273"];
    self.subTitle1.font = font;
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleNavBar:)];
    //singleFingerTap.cancelsTouchesInView = NO;
    [self.subTitle1 addGestureRecognizer:singleFingerTap];
    self.subTitle1.userInteractionEnabled=YES;
    
    tip1 = [[UIImageView alloc]initWithFrame:CGRectMake(-170, 550, 360, 180)];
    if ([[[PV sharedInstance] language] isEqual:@"ES"]) tip1.image = [UIImage imageNamed:@"tip2.png"]; else tip1.image = [UIImage imageNamed:@"tip2EN.png"];
    tip1.alpha = 0;
    tip2 = [[UIImageView alloc]initWithFrame:CGRectMake(300, 0, 360, 180)];
    if ([[[PV sharedInstance] language] isEqual:@"ES"]) tip2.image = [UIImage imageNamed:@"tip3.png"]; else tip2.image = [UIImage imageNamed:@"tip3EN.png"];
    tip2.alpha = 0;
    tip3 = [[UIImageView alloc]initWithFrame:CGRectMake(620, -20, 360, 180)];
    if ([[[PV sharedInstance] language] isEqual:@"ES"]) tip3.image = [UIImage imageNamed:@"tip4.png"]; else tip3.image = [UIImage imageNamed:@"tip4EN.png"];
    tip3.alpha = 0;
    tip4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 360, 180)];
    if ([[[PV sharedInstance] language] isEqual:@"ES"]) tip4.image = [UIImage imageNamed:@"tip5.png"]; else tip4.image = [UIImage imageNamed:@"tip5EN.png"];
    tip4.alpha = 0;

    
}

- (IBAction)helpIconTap:(id)sender {
    
    NSLog(@"Help icon");
    if (tip1.alpha<1){
        tip1.alpha=1;
        tip2.alpha=1;
        tip3.alpha=1;
        tip4.alpha=1;
    
        [self.view addSubview:tip1];
        [self.view addSubview:tip2];
        [self.view addSubview:tip3];
        [self.view addSubview:tip4];
    
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(removeTipSection:) userInfo:nil repeats:NO];
    } else {
        
        [self removeTipSection:nil];

    }

}


- (void)removeTipSection:(id)sender {
    [UIView animateWithDuration:0.6
                          delay:0
                        options:(UIViewAnimationOptionTransitionNone | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         // Display help
                         tip1.alpha = 0.0;
                         tip2.alpha = 0.0;
                         tip3.alpha = 0.0;
                         tip4.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         if (finished){
                             [tip1 removeFromSuperview];
                             [tip2 removeFromSuperview];
                             [tip3 removeFromSuperview];
                             [tip4 removeFromSuperview];
                         }
                     }];
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)displayTitleOfPage:(int) page AtSection:(int) section InView:(UIView*)view{
    self.subTitle1.text = [[PV sharedInstance] titleOfPage:page section:section];
    [view addSubview:self.subTitle1];
}

- (void) printImage:(PVImageView *)imageView Named:(NSString*)imageName Legend:(NSString *)legend InView:(UIView *)page WithLink:(NSString *)link TapRecognizer:(UITapGestureRecognizer *)recog{

    // Populate PVImage
    imageView.originalImage = [UIImage imageNamed:imageName];
    imageView.name = imageName;
    imageView.legend = legend;
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:recog];
    
    // Scale
    imageView.image = [self resizeImage:imageView.originalImage newSize:CGSizeMake(floor(imageView.frame.size.width), floor(imageView.frame.size.height))];
    imageView.thumbnail = imageView.image.copy;
    imageView.frame = CGRectMake(floor(imageView.frame.origin.x),floor(imageView.frame.origin.y), floor(imageView.frame.size.width), floor(imageView.frame.size.height));
    
    // //NSLog(@"Frame: %@", NSStringFromCGRect(imageView.frame));
    
    // Appearance
    imageView.layer.shadowColor = [UIColor grayColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(3, 3);
    imageView.layer.shadowOpacity = 1;
    imageView.layer.shadowRadius = 2.0;
    imageView.clipsToBounds = NO;
    [page addSubview:imageView];
    
    
    // Is it an HD image?
    CGFloat width = imageView.originalImage.size.width;
    CGFloat height = imageView.originalImage.size.height;
    bool wantsFullScreen = (width>1024-60)||(height>768-60);
    
    // Pring Legend
    CGRect titleFrame = imageView.frame;
    titleFrame.origin.x = imageView.frame.origin.x + 20;
    titleFrame.origin.y = imageView.frame.origin.y + imageView.frame.size.height + 5;
    titleFrame.size.height = 20;
    titleFrame.size.width = titleFrame.size.width - 22;
    title = [[UILabel alloc] initWithFrame:titleFrame];
    title.text = legend;
    title.numberOfLines = 2;
    title.textAlignment = UITextAlignmentLeft;
    [title setFont:[UIFont fontWithName:@"PF Ronda Seven" size:8]];
    [page addSubview:title];
        
    // Print wikipedia link
    if ([link length]){
        CGRect wikiFrame;
        wikiFrame.origin.x = imageView.frame.origin.x + imageView.frame.size.width - 20;
        wikiFrame.origin.y = imageView.frame.origin.y + imageView.frame.size.height + 5;
        wikiFrame.size.width = 20;
        wikiFrame.size.height = 20;
        PVUIButton *button = [PVUIButton buttonWithType:UIButtonTypeCustom];
        button.link = link;
        button.frame = wikiFrame;
        [button setBackgroundImage:[UIImage imageNamed:@"wlogo.png"]forState:UIControlStateNormal];
        [button addTarget:self 
               action:@selector(pushWikiController:)
         forControlEvents:UIControlEventTouchDown];
        [page addSubview:button];
    }
    
    
    // Display HD icon
    if (wantsFullScreen){
        CGRect iconFrame = titleFrame;
        iconFrame.origin.x = iconFrame.origin.x-20;
        iconFrame.origin.y = iconFrame.origin.y+7;
        iconFrame.size.width = 15;
        iconFrame.size.height = 8;
        UIImageView *hdIcon = [[UIImageView alloc] initWithFrame:iconFrame];
        [hdIcon setImage:[UIImage imageNamed:@"icon-hd.gif"]]; 
        [page addSubview:hdIcon];
    }
     //NSLog(@"Pring image complete");
    
}
- (CGRect) hFrameForHeight:(double)height forImage:(NSString*) imageName atX:(double)x Y:(double)y {
    UIImage *image = [UIImage imageNamed:imageName];
    return CGRectMake(x, y, image.size.width*height/image.size.height, height);
}

- (CGRect) vFrameForWidth:(double)width forImage:(NSString*)imageName atX:(double)x Y:(double)y {
    UIImage *image = [UIImage imageNamed:imageName];
    return CGRectMake(x, y, width, image.size.height*width/image.size.width);
}

- (void) printColumFor:(NSArray*)images at:(UIView*)page withWidth:(double)width atX:(double)x Y:(double)y {
    NSEnumerator *e = [images objectEnumerator];
    PVImageView *image;
    double yOffset = y;
    double bottomPadding = 60;
    while (image = (PVImageView*)[e nextObject]) {
        //NSLog(@"iterando %@", image.name);
        bottomPadding = 60;
        image.frame = [self vFrameForWidth:width forImage:image.name atX:x Y:yOffset];
        if ([[[PV sharedInstance] language] isEqual:@"ES"]){
            [self printImage:image Named:image.name Legend:image.legend InView:page WithLink:image.link TapRecognizer: image.recog];
        } else {
            [self printImage:image Named:image.name Legend:image.legendEN InView:page WithLink:image.linkEN TapRecognizer: image.recog];
        }
        
        if (image.bottomPadding>60) bottomPadding=image.bottomPadding;
        yOffset= yOffset + image.frame.size.height+bottomPadding;
    }
}

- (void) printRowFor:(NSArray*)images at:(UIView*)page withHeight:(double)height atX:(double)x Y:(double)y {
    NSEnumerator *e = [images objectEnumerator];
    PVImageView *image;
    double xOffset = x;
    double rightPadding = 60;
    while (image = (PVImageView*)[e nextObject]) {
        //NSLog(@"iterando %@", image.name);
        rightPadding = 60;
        image.frame = [self hFrameForHeight:height forImage:image.name atX:xOffset Y:y];
        if ([[[PV sharedInstance] language] isEqual:@"ES"]){
            [self printImage:image Named:image.name Legend:image.legend InView:page WithLink:image.link TapRecognizer: image.recog];
        } else {
            [self printImage:image Named:image.name Legend:image.legendEN InView:page WithLink:image.linkEN TapRecognizer: image.recog];
        }
        
        xOffset= xOffset + image.frame.size.width+rightPadding;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NSLog(@"Segue id: %@",[segue identifier]);
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    if([[segue identifier] isEqualToString:@"wiki"]){
        //NSLog(@"Matched: wiki");
        PVWikiController *wikiController = [segue destinationViewController];
        wikiController.url = linkSegue;
    }
    
    if([[segue identifier] isEqualToString:@"interactive"]){
        //NSLog(@"Matched: interactive");
        
        if ([[[PV sharedInstance] language] isEqual:@"ES"]){
            UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Volver" style:UIBarButtonItemStyleBordered target:nil action:nil];
            [[self navigationItem] setBackBarButtonItem:backButton];
        }
        
        if ([[[PV sharedInstance] language] isEqual:@"EN"]){
            UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
            [[self navigationItem] setBackBarButtonItem:backButton];
        }
        
        PVInteractiveImageViewController *intractiveController = [segue destinationViewController];
        intractiveController.imageId = self.imageSegue;
        intractiveController.navigationTitle=self.imageSegueTitle;
    }  
    
}

- (IBAction)pushWikiController:(PVUIButton *)obj {
    //UIButton *button = (UIButton*)obj;
    linkSegue = obj.link;
    //NSLog(@"Found link %@", linkSegue);
    [self performSegueWithIdentifier:@"wiki" sender:self];
}
    
- (void)pageControlPageDidChange:(PageControl *)pageControl {
    CGFloat x = 1024*pageControl.currentPage;
    [self.scrollview setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)toggleNavBar:(UITapGestureRecognizer *)recognizer {
    //NSLog(@"toggle nav bar");
    if ([self.navigationController isNavigationBarHidden]) {
        [self.navigationController setNavigationBarHidden:FALSE animated:YES];
    } else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollview.frame.size.width;
    int page = floor((self.scrollview.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    int titlesInSection = [[PV sharedInstance] titlesofPages:self.section].count;
    
    if (self.pageControl.currentPage != page && page<titlesInSection){
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.subTitle1.frame = CGRectMake(1024*page+5, 5, 900, 50);
                     } completion:^(BOOL finished){
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              self.subTitle1.alpha = 0.1;

                                          } completion: ^(BOOL finished){
                                              self.subTitle1.text = [[PV sharedInstance] titleOfPage:page+1 section:self.section];
                                              [UIView animateWithDuration:0.30
                                                               animations:^{
                                                                   self.subTitle1.alpha = 1;
                                                                   
                                                               } ];
                                              
                                          }];
                          
                     }];       
    }
    self.pageControl.currentPage = page;
    [self.view bringSubviewToFront:title];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

- (void)loadPageContentForPage: (int)page Section: (int)section AtFrame: (CGRect)frame OnView:(UIView *)view scrolls:(BOOL)scrolls {
    UIWebView *page1Text = [[UIWebView alloc] initWithFrame:frame];
    page1Text.scrollView.scrollEnabled = scrolls;
    NSString *pageBody = [self.pageHeader stringByAppendingString:[[PV sharedInstance] contentAtPage:page section:section]];
    pageBody = [pageBody stringByAppendingString:@"</body>"]; 
    //NSLog(@"%@", page1Body);
    [page1Text loadHTMLString:pageBody baseURL:self.baseURL]; 
    page1Text.scrollView.bounces = NO;
    page1Text.scrollView.showsVerticalScrollIndicator=NO;
    page1Text.scrollView.contentSize = CGSizeMake(750, 4000); 
    [view addSubview:page1Text];
}

- (IBAction)nextPage {
    CGFloat x = self.scrollview.contentOffset.x;
    CGFloat y = self.scrollview.contentOffset.y;
    if (x<1024*(self.pageControl.numberOfPages-1)) [self.scrollview setContentOffset:CGPointMake(x+1024,y) animated:YES];
    else [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)prevPage {
    
    CGFloat x = self.scrollview.contentOffset.x;
    CGFloat y = self.scrollview.contentOffset.y;
    if (x>0) [self.scrollview setContentOffset:CGPointMake(x-1024,y) animated:YES];
    else [self.navigationController popViewControllerAnimated:YES];
}

- (void) handleSimpleImageTap:(UITapGestureRecognizer *)recognizer onImage:(PVImageView *)imageView onPage:(UIView *)page {
    
    CGFloat width = imageView.originalImage.size.width;
    CGFloat height = imageView.originalImage.size.height;
 
    // imageFrame will contain the right frame for the scaled image
    CGRect imageFrame;
    imageFrame.size = CGSizeMake(imageView.originalImage.size.width, imageView.originalImage.size.height);
    if (width > 1024-60) imageFrame.size.width = 1024-60;
    if (height > 768-60) imageFrame.size.height = 768-60;
    imageFrame.origin.x=(1024-imageFrame.size.width)/2;
    imageFrame.origin.y=(768-imageFrame.size.height)/2;

    if (self.curtain.hidden){  
        
        // Save original settins
        handleSingleTapViewBox = page;
        initialFrameAux = imageView.frame;
        
        // Prepare curtain
        //NSLog(@"Image frame: %f, %f", imageView.frame.origin.x, imageView.frame.origin.y);
        //CGPoint a = self.scrollview.contentOffset;
        CGPoint b = ((UIScrollView*)page).contentOffset;
        CGPoint c = CGPointMake(b.x, b.y-50);
        
        //NSLog(@"Temp frame: %f, %f", imageView.frame.origin.x-c.x, imageView.frame.origin.y-c.y);
        
        [imageView removeFromSuperview];
        [self.view addSubview:self.curtain];
        imageView.image = imageView.originalImage;
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(imageView.frame.origin.x-c.x, imageView.frame.origin.y-c.y,imageView.frame.size.width, imageView.frame.size.height);
        
        [self.view addSubview:imageView];
        self.curtain.hidden = NO;
        self.scrollview.userInteractionEnabled=NO;
        
        // Scale image in an animation and display label
        [UIView animateWithDuration:1
                         animations:^{
                             self.curtain.alpha = 0.9;
                             imageView.frame = imageFrame;
                         }completion:^(BOOL finished){
                             // display label
                             legendLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 1024-60, 25)];
                             legendLabel.backgroundColor = [UIColor blackColor];
                             legendLabel.text = imageView.legend;
                             legendLabel.textColor = [UIColor whiteColor];
                             legendLabel.textAlignment = UITextAlignmentCenter;
                             legendLabel.layer.cornerRadius = 8;
                             legendLabel.numberOfLines = 2;
                             [legendLabel setFont:[UIFont fontWithName:@"OFL Sorts Mill Goudy TT" size:17]];
                             [self.view addSubview:legendLabel];
                         }];
        
        
    } else {
        
        // Remove elements
        [legendLabel removeFromSuperview];
        [imageView removeFromSuperview];
        
        // Restore original image location and properties
        //NSLog(@"Restore: %@", NSStringFromCGRect(initialFrameAux));
        imageView.frame = initialFrameAux;
        imageView.image = imageView.thumbnail;
        [handleSingleTapViewBox addSubview:imageView];
        
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.curtain.alpha = 0;
                         } completion:^(BOOL finished){
                             self.curtain.hidden=YES;
                         }];     
        self.scrollview.userInteractionEnabled=YES;
    }
    
    
    
    
}


- (void) drawTimeline:(int) section onPage:(UIView*)page {
    
    // Environment variables
    timelineView.section = self.section;
    timelinevisible = NO;
    
    // Arrow to depoy timeline panel
    arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
    [arrow addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)]];
     [arrow addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleTimeline:)]];
    arrow.userInteractionEnabled = YES;
    arrow.frame = CGRectMake(10, 325, 50, 50);
    [page addSubview:arrow];
    
    // Help Icon
    helpIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10,page.frame.size.height-40,32,32)];
    helpIcon.image = [UIImage imageNamed:@"help.png"];
    helpIcon.alpha = 0.4;
    helpIcon.userInteractionEnabled = YES;
    [helpIcon addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(helpIconTap:)]];
    [page addSubview:helpIcon];
    
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {

    //NSLog(@"panTImeline");
    CGPoint translation = [recognizer translationInView:self.view];
    timelineView.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
        
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];

}

- (IBAction)toggleTimeline:(id)sender {
    //NSLog(@"toggleTImeline from %i", timelinevisible);
    if (timelinevisible){
        [timelineView removeFromSuperview];
        arrow.hidden =  NO;
        timelinevisible = NO;
    } else {
        timelineView.alpha = 0;
        [self.scrollview addSubview:timelineView];
        arrow.hidden =  YES;
        timelinevisible = YES;
        [UIView animateWithDuration:0.3
                         animations:^{
                             timelineView.alpha=1;
                         }];
    }
}

- (UIImage *)resizeImage:(UIImage*)image newSize:(CGSize)newSize {
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
    CGImageRef imageRef = image.CGImage;
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Set the quality level to use when rescaling
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height);
    
    CGContextConcatCTM(context, flipVertical);
    // Draw into the context; this scales the image
    CGContextDrawImage(context, newRect, imageRef);
    
    // Get the resized image from the context and a UIImage
    CGImageRef newImageRef = CGBitmapContextCreateImage(context);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    CGImageRelease(newImageRef);
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIColor*)colorWithHexString:(NSString*)hex {  
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];  
    
    // String should be 6 or 8 characters  
    if ([cString length] < 6) return [UIColor grayColor];  
    
    // strip 0X if it appears  
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];  
    
    if ([cString length] != 6) return  [UIColor grayColor];  
    
    // Separate into r, g, b substrings  
    NSRange range;  
    range.location = 0;  
    range.length = 2;  
    NSString *rString = [cString substringWithRange:range];  
    
    range.location = 2;  
    NSString *gString = [cString substringWithRange:range];  
    
    range.location = 4;  
    NSString *bString = [cString substringWithRange:range];  
    
    // Scan values  
    unsigned int r, g, b;  
    [[NSScanner scannerWithString:rString] scanHexInt:&r];  
    [[NSScanner scannerWithString:gString] scanHexInt:&g];  
    [[NSScanner scannerWithString:bString] scanHexInt:&b];  
    
    return [UIColor colorWithRed:((float) r / 255.0f)  
                           green:((float) g / 255.0f)  
                            blue:((float) b / 255.0f)  
                           alpha:1.0f];  
}

@end
