//
//  PVPintorPiradoViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVPintorPiradoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PPPinturas.h"
#import "PPPintura.h"
#import "PV.h"

@interface PVPintorPiradoViewController ()

@end

@implementation PVPintorPiradoViewController

UIImageView *imageViewForAnimation, *imageForPlay, *background, *picaso, *picasoImage;
UIImageView *plusOne, *minusOne;

UILabel *scoreLabel, *scoreLabelText, *nivelLabel, *nivelLabelText, *missLabel, *missLabelText, *timerLabel, *option1, *option2, *option3, *option4,  *option1Label, *option2Label, *option3Label, *option4Label;

UIImage *auxUIImage;

NSTimer *timerLoop, *circleLoop; 

PPPinturas *pinturas;
PPPintura *currentPintura;
NSArray *currentOptions;

NSString *theImageThatWasJustPlayed;

int score = 0;
int correctOption = 0;
int lives = 3;
int currentLevel = 1;
int timerInterval = 20;
int currentTimer = 20;



- (void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    score = 0;
    correctOption = 0;
    lives = 3;
    currentLevel = 1;
    timerInterval = 20;
    currentTimer = 20;
    
    // Load Picaso face
    picaso = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic.png"]];
    picaso.frame = CGRectMake(10, 300, picaso.frame.size.width, picaso.frame.size.height);
    auxUIImage = [[UIImage alloc]init];
    imageViewForAnimation = [[UIImageView alloc] init];
    
    [self.view addSubview:picaso];
    
    pinturas = [[PPPinturas alloc]init];
    picasoImage = [[UIImageView alloc] init];
    NSString *msg= @"Ayuda al olvidadizo Pablo a catalogar la colección.\n Sólo una de las líneas es correcta. Arrastra la obra en este elemento!";
    if ([[[PV sharedInstance] language] isEqual:@"EN"]) msg = @"Help forgetful Pablo classifying his spanish art collection. Only one of the options in the right bins is correct. Drag the painting to it before the timer goes to zero";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Pintor Pirado"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    
 
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(gameOn) userInfo:nil repeats:NO];
}

- (void) viewDidDisappear:(BOOL)animated{
    score = 0;
    correctOption = 0;
    lives = 3;
    timerInterval = 20;
    currentTimer = 20;
    [timerLoop invalidate];
    [circleLoop invalidate];
    
}

- (void) gameOn {
    if (timerLoop) [timerLoop invalidate];
    if (circleLoop) [circleLoop invalidate];
    if (lives < 1) {
        // Game over
        [timerLoop invalidate];
        [circleLoop invalidate];

        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Pintor Pirado"
                                                        message:@"Game over / Se acabó el juego"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else {
        // Si la puntuacion es mayor que 10, aumentar nivel
        if (score > 9){
            // Aumenter nivel
            if (currentLevel <3) {
               score = 0;
               currentLevel++;
               nivelLabel.text = [[NSNumber numberWithInt:currentLevel] stringValue];
            }
        }
        
        // Game on! juego normal
        scoreLabel.text = [[NSNumber numberWithInt:score] stringValue];
        missLabel.text = [[NSNumber numberWithInt:lives] stringValue];
        
        [self pintorPirado];
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(throw) userInfo:nil repeats:NO];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(options) userInfo:nil repeats:NO];
        [NSTimer scheduledTimerWithTimeInterval:1+0.5 target:self selector:@selector(show) userInfo:nil repeats:NO];
        timerLoop = [NSTimer scheduledTimerWithTimeInterval:(timerInterval+1.5) target:self selector:@selector(itsTime) userInfo:nil repeats:NO];

        currentTimer = timerInterval;
        timerLabel.textColor = [UIColor whiteColor];
        circleLoop = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    }
}

- (void) itsTime {
    if (picasoImage) [picasoImage removeFromSuperview];
    if (!imageForPlay.hidden) {
        missLabel.text = [[NSNumber numberWithInt:--lives] stringValue];
        [imageForPlay removeFromSuperview];
        
        minusOne.frame = CGRectMake(512, 500, 10, 10);
        minusOne.alpha=1;
        [self.view addSubview:minusOne];
        [UIView animateWithDuration:0.8
                         animations:^{
                             minusOne.frame = CGRectMake(512, 300, 200, 200);
                             minusOne.alpha=0.2;
                         } completion:^(BOOL finished) {
                             [minusOne removeFromSuperview];
                         }];
        
    }
    [self gameOn];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    // Load Background
    background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ppback.jpg"]];
    background.frame = CGRectMake(0, 0, 1024, 768);
    [self.view addSubview:background];
 
    // Score
    UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:30];
    UIFont *fontSmall = [UIFont fontWithName:@"Helvetica Neue" size:15];
    
    scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 100, 75)];
    scoreLabel.text = [[NSNumber numberWithInt:score] stringValue];
    scoreLabel.backgroundColor = [UIColor blackColor];
    scoreLabel.textColor = [UIColor whiteColor];
    scoreLabel.layer.cornerRadius = 12;
    scoreLabel.numberOfLines = 2;
    scoreLabel.font = font;
    scoreLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:scoreLabel];
    UIImageView *pointIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"point.png"]];
    pointIcon.frame = CGRectMake(165, 20, 25, 25);
    [self.view addSubview:pointIcon];
    scoreLabelText = [[UILabel alloc] initWithFrame:CGRectMake(90, 15, 100, 15)];
    scoreLabelText.text = @"Aciertos";
    if ([[[PV sharedInstance] language] isEqual:@"EN"]) scoreLabelText.text = @"Score";
    scoreLabelText.textColor = [UIColor blackColor];
    scoreLabelText.backgroundColor = [UIColor clearColor];
    scoreLabelText.font = fontSmall;
    [self.view addSubview:scoreLabelText];
    nivelLabel= [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 50, 75)];
    nivelLabel.text = [[NSNumber numberWithInt:currentLevel] stringValue];
    nivelLabel.backgroundColor = [UIColor grayColor];
    nivelLabel.textColor = [UIColor blackColor];
    nivelLabel.layer.cornerRadius = 12;
    nivelLabel.numberOfLines = 2;
    nivelLabel.font = font;
    nivelLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:nivelLabel];
    nivelLabelText= [[UILabel alloc] initWithFrame:CGRectMake(40, 15, 50, 15)];
    nivelLabelText.text = @"Nivel";
    if ([[[PV sharedInstance] language] isEqual:@"EN"]) nivelLabelText.text = @"Level";
    nivelLabelText.textColor = [UIColor blackColor];
    nivelLabelText.backgroundColor = [UIColor clearColor];
    nivelLabelText.font = fontSmall;
    [self.view addSubview:nivelLabelText];
    
    
    // Vidas
    missLabel = [[UILabel alloc] initWithFrame:CGRectMake(900, 30, 100, 75)];
    missLabel.text = [[NSNumber numberWithInt:score] stringValue];
    missLabel.backgroundColor = [UIColor blackColor];
    missLabel.textColor = [UIColor whiteColor];
    missLabel.layer.cornerRadius = 12;
    missLabel.numberOfLines = 2;
    missLabel.font = font;
    missLabel.textAlignment = UITextAlignmentCenter;
    missLabel.text = [[NSNumber numberWithInt:lives] stringValue];
    [self.view addSubview:missLabel];
    UIImageView *failIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fail.png"]];
    failIcon.frame = CGRectMake(987, 20, 25, 25);
    [self.view addSubview:failIcon];
    missLabelText= [[UILabel alloc] initWithFrame:CGRectMake(910, 15, 200, 15)];
    missLabelText.text = @"Vidas";
    if ([[[PV sharedInstance] language] isEqual:@"EN"]) missLabelText.text = @"Lifes";
    missLabelText.textColor = [UIColor blackColor];
    missLabelText.backgroundColor = [UIColor clearColor];
    missLabelText.font = fontSmall;
    [self.view addSubview:missLabelText];
    
    // Timer
    timerLabel = [[UILabel alloc] initWithFrame:CGRectMake((1024/2)-50, 30, 100, 75)];
    timerLabel.text = [[NSNumber numberWithInt:score] stringValue];
    timerLabel.backgroundColor = [UIColor grayColor];
    timerLabel.textColor = [UIColor whiteColor];
    timerLabel.layer.cornerRadius = 12;
    timerLabel.numberOfLines = 2;
    timerLabel.font = font;
    timerLabel.textAlignment = UITextAlignmentCenter;
    timerLabel.text = timerLabel.text = [@":" stringByAppendingString:[[NSNumber numberWithInt:currentTimer] stringValue]];;
    [self.view addSubview:timerLabel];
    UIImageView *timerIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"time.png"]];
    timerIcon.frame = CGRectMake(500, 20, 25, 25);
    [self.view addSubview:timerIcon];
    
    // Icons
    plusOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plusone.png"]];
    minusOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minusone.png"]];
    
    
    pinturas = [[PPPinturas alloc]init];
    currentPintura = [pinturas randomPinturaForLevel:1];
    currentOptions = [currentPintura configForOption:(arc4random() % (1))];
    
    option1 = [[UILabel alloc] initWithFrame:CGRectMake(800, 200, 200, 75)];
    option1.text = @"";
    option1.backgroundColor = [UIColor blackColor];
    option1.textColor = [UIColor whiteColor];
    option1.layer.cornerRadius = 8;
    option1.numberOfLines = 2;
    option1Label = [[UILabel alloc] initWithFrame:CGRectMake(810, 185, 200, 15)];
    option1Label.text = @"Obra";
    if ([[[PV sharedInstance] language] isEqual:@"EN"]) option1Label.text = @"Title";
    
    option1Label.textColor = [UIColor blackColor];
    option1Label.backgroundColor = [UIColor clearColor];
    option1Label.font = fontSmall;
    [self.view addSubview:option1Label];
    [self.view addSubview:option1];
    
    option2 = [[UILabel alloc] initWithFrame:CGRectMake(800, 300, 200, 75)];
    option2.text = @"";
    option2.backgroundColor = [UIColor blackColor];
    option2.textColor = [UIColor whiteColor];
    option2.layer.cornerRadius = 8;
    option2.numberOfLines = 2;
    option2Label = [[UILabel alloc] initWithFrame:CGRectMake(810, 285, 200, 15)];
    option2Label.text = @"Autor";
    if ([[[PV sharedInstance] language] isEqual:@"EN"]) option2Label.text = @"Author";
    option2Label.textColor = [UIColor blackColor];
    option2Label.backgroundColor = [UIColor clearColor];
    option2Label.font = fontSmall;
    [self.view addSubview:option2Label];
    [self.view addSubview:option2];
    
    option3 = [[UILabel alloc] initWithFrame:CGRectMake(800, 400, 200, 75)];
    option3.text = @"";
    option3.backgroundColor = [UIColor blackColor];
    option3.textColor = [UIColor whiteColor];
    option3.layer.cornerRadius = 8;
    option3.numberOfLines = 2;
    option3Label = [[UILabel alloc] initWithFrame:CGRectMake(810, 385, 200, 15)];
    option3Label.text = @"Movimiento";
    if ([[[PV sharedInstance] language] isEqual:@"EN"]) option3Label.text = @"Movement";
    option3Label.textColor = [UIColor blackColor];
    option3Label.backgroundColor = [UIColor clearColor];
    option3Label.font = fontSmall;
    [self.view addSubview:option3Label];
    [self.view addSubview:option3];
    
    option4 = [[UILabel alloc] initWithFrame:CGRectMake(800, 500, 200, 75)];
    option4.text = @"";
    option4.backgroundColor = [UIColor blackColor];
    option4.textColor = [UIColor whiteColor];
    option4.layer.cornerRadius = 8;
    option4.numberOfLines = 2;
    option4Label = [[UILabel alloc] initWithFrame:CGRectMake(810, 485, 200, 15)];
    option4Label.text = @"Siglo";
    if ([[[PV sharedInstance] language] isEqual:@"EN"]) option4Label.text = @"Century";
    option4Label.textColor = [UIColor blackColor];
    option4Label.backgroundColor = [UIColor clearColor];
    option4Label.font = fontSmall;
    [self.view addSubview:option4Label];
    [self.view addSubview:option4];
    
    }

- (void) tick {
    timerLabel.text = [@":" stringByAppendingString:[[NSNumber numberWithInt:currentTimer--] stringValue]];
    if (currentTimer<5 && currentTimer>3) timerLabel.textColor = [UIColor yellowColor];
    if (currentTimer <3){
        timerLabel.textColor = [UIColor redColor];
    }
}

- (IBAction) handlePan:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    
    if (recognizer.state == UIGestureRecognizerStateEnded){
        
        bool correct = NO;
        bool valid = NO;
        
        CGPoint location = [recognizer locationInView:self.view];
        if (CGRectContainsPoint(CGRectMake(800, 200, 200, 75), location)){
            [recognizer.view removeFromSuperview];
            if (correctOption == 1) correct = YES; else valid = YES;
        }            
        if (CGRectContainsPoint(CGRectMake(800, 300, 200, 75), location)){
            [recognizer.view removeFromSuperview];
            if (correctOption == 2) correct = YES;else valid = YES;
        }
        if (CGRectContainsPoint(CGRectMake(800, 400, 200, 75), location)){
            [recognizer.view removeFromSuperview];
            if (correctOption == 3) correct = YES;else valid = YES;
        }
        if (CGRectContainsPoint(CGRectMake(800, 500, 200, 75), location)){
            [recognizer.view removeFromSuperview];
            if (correctOption == 4) correct = YES;else valid = YES;
        }
        
        if (valid || correct){
            if (correct) {
                score++;
                
                plusOne.frame = CGRectMake(900, 150+correctOption*100, 10, 10);
                plusOne.alpha=1;
                [self.view addSubview:plusOne];
                [UIView animateWithDuration:0.4
                                 animations:^{
                                     plusOne.frame = CGRectMake(500, 150+correctOption*80, 200, 200);
                                     plusOne.alpha=0.2;
                                 } completion:^(BOOL finished) {
                                     [plusOne removeFromSuperview];
                                 }];
                
                [self gameOn];
            } else {
                lives--;
                
                minusOne.frame = CGRectMake(900, 150+correctOption*100, 10, 10);
                minusOne.alpha=1;
                [self.view addSubview:minusOne];
                [UIView animateWithDuration:0.8
                                 animations:^{
                                     minusOne.frame = CGRectMake(600+correctOption*100, 100, 200, 200);
                                     minusOne.alpha=0.2;
                                 } completion:^(BOOL finished) {
                                     [minusOne removeFromSuperview];
                                 }];
                
                [self gameOn];
                

            }

        }
    } 
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    [imageForPlay.layer removeAllAnimations];
    imageForPlay.alpha=0.7;
}

- (void) show {
    
    [imageViewForAnimation removeFromSuperview];
    
    UIImage *auxImage = [UIImage imageNamed:currentPintura.filename];
    auxImage = [self resizeImage:(auxImage)newSize:(CGSizeMake(200, auxImage.size.height * (200.0f / auxImage.size.width)))];
    
    imageForPlay = [[UIImageView alloc] initWithImage:auxImage];;
    [imageForPlay addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)]];
    imageForPlay.userInteractionEnabled = YES;
    imageForPlay.frame = CGRectMake(500, 500, 300.0f, imageForPlay.frame.size.height * (300.0f / imageForPlay.frame.size.width));
    imageForPlay.center = CGPointMake(500, 500);
    
    [self.view addSubview:imageForPlay];
    
    imageForPlay.layer.zPosition = 0;
    background.layer.zPosition = -161.0f;
    
    CALayer *touchedLayer = [imageForPlay layer];
    CABasicAnimation *wiggle = [CABasicAnimation animationWithKeyPath:@"transform"];
    wiggle.duration = 0.1;
    wiggle.repeatCount = 1e30f;
    wiggle.autoreverses = YES;
    wiggle.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(touchedLayer.transform,0.1, 0.0 ,1.0 ,1.0)];
    [touchedLayer addAnimation:wiggle forKey:@"wiggle"];
    
}

- (void) options {

    [UIView animateWithDuration:0.3
                     animations:^{
                         option1.frame = CGRectMake(1024, 200, 200, 75);
                         option2.frame = CGRectMake(1024, 300, 200, 75);
                         option3.frame = CGRectMake(1024, 400, 200, 75);
                         option4.frame = CGRectMake(1024, 500, 200, 75);
                         option1Label.frame = CGRectMake(1024, 200, 200, 75);
                         option2Label.frame = CGRectMake(1024, 300, 200, 75);
                         option3Label.frame = CGRectMake(1024, 400, 200, 75);
                         option4Label.frame = CGRectMake(1024, 500, 200, 75);
                         
                     } completion:^(BOOL finished) {
                         
                         option1.text = [currentOptions objectAtIndex:0];
                         option2.text = [currentOptions objectAtIndex:1];
                         option3.text = [currentOptions objectAtIndex:2];
                         option4.text = [currentOptions objectAtIndex:3];
                         
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              option1.frame = CGRectMake(800, 200, 200, 75);
                                              option2.frame = CGRectMake(800, 300, 200, 75);
                                              option3.frame = CGRectMake(800, 400, 200, 75);
                                              option4.frame = CGRectMake(800, 500, 200, 75);
                                              option1Label.frame = CGRectMake(810, 185, 200, 15);
                                              option2Label.frame = CGRectMake(810, 285, 200, 15);
                                              option3Label.frame = CGRectMake(810, 385, 200, 15);
                                              option4Label.frame = CGRectMake(810, 485, 200, 15);
                                                                
                     }];
        }];
    
}

- (void) pintorPirado {
    
    // Lanzar los dados....
    currentPintura = [pinturas randomPinturaForLevel:currentLevel];
    
    // Asegurarnos de que no se ensenya la misma pintura repetida
    while ([currentPintura.filename isEqualToString:theImageThatWasJustPlayed]) currentPintura = [pinturas randomPinturaForLevel:currentLevel];
    theImageThatWasJustPlayed = currentPintura.filename;
    
    
    correctOption = ((arc4random() % 4)+1);
    currentOptions = [currentPintura configForOption:correctOption];
    
    // Prepare peek a boo of picture
    auxUIImage = [UIImage imageNamed:currentPintura.filename];
    picasoImage.image = [self resizeImage:(auxUIImage)newSize:(CGSizeMake(80, auxUIImage.size.height * (80.0f / auxUIImage.size.width)))];
    picasoImage.frame = CGRectMake(-310, 375, 80, auxUIImage.size.height * (80.0f / auxUIImage.size.width));
    [self.view addSubview:picasoImage];
    [UIView animateWithDuration:0.3
                     animations:^{
                         picaso.frame = CGRectMake(-310, 300, picaso.frame.size.width, picaso.frame.size.height);
                     } completion:^(BOOL finished) {
                                                                       
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              picaso.frame = CGRectMake(10, 300, picaso.frame.size.width, picaso.frame.size.height);
                                                  picasoImage.frame = CGRectMake(10, 375, 80, picasoImage.frame.size.height * (80.0f / picasoImage.frame.size.width));
                                          } completion:^(BOOL finished) {
                                              
                                              
                                          }];
                     }];

}

- (void) throw {
    
    // Cargar imagen para la animacion
    auxUIImage = [UIImage imageNamed:currentPintura.filename];
    imageViewForAnimation = [[UIImageView alloc] initWithImage:[self resizeImage:(auxUIImage)newSize:(CGSizeMake(80, auxUIImage.size.height * (80.0f / auxUIImage.size.width)))]];
    
    imageViewForAnimation.alpha=0.3;
    
    
    CGRect imageFrame = imageViewForAnimation.frame;
    CGPoint viewOrigin = imageViewForAnimation.frame.origin;
    viewOrigin.y = viewOrigin.y + imageFrame.size.height / 2.0f;
    viewOrigin.x = viewOrigin.x + imageFrame.size.width / 2.0f;
    
    // imageViewForAnimation.frame = imageFrame;
    imageViewForAnimation.layer.position = CGPointMake(50, 500);
    
    [self.view addSubview:imageViewForAnimation];
    [picasoImage removeFromSuperview];
    [self.view bringSubviewToFront:option1];
    [self.view bringSubviewToFront:option2];
    [self.view bringSubviewToFront:option3];
    [self.view bringSubviewToFront:option4];
    
    
    // Set up fade out effect
    CABasicAnimation *fadeOutAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeOutAnimation setToValue:[NSNumber numberWithFloat:1]];
    fadeOutAnimation.fillMode = kCAFillModeForwards;
    fadeOutAnimation.removedOnCompletion = NO;
    
    // Set up scaling
    CABasicAnimation *resizeAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    [resizeAnimation setToValue:[NSValue valueWithCGSize:CGSizeMake(200.0f, imageFrame.size.height * (200.0f / imageFrame.size.width))]];
    resizeAnimation.fillMode = kCAFillModeForwards;
    resizeAnimation.removedOnCompletion = NO;
    
    // Set up path movement
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    //Setting Endpoint of the animation
    CGPoint endPoint = CGPointMake(500, 500);
    //to end animation in last tab use 
    //CGPoint endPoint = CGPointMake( 320-40.0f, 480.0f);
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, viewOrigin.x, viewOrigin.y);
    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, viewOrigin.y, endPoint.x, viewOrigin.y, endPoint.x, endPoint.y);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    CAAnimationGroup *group = [CAAnimationGroup animation]; 
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setAnimations:[NSArray arrayWithObjects:fadeOutAnimation, pathAnimation, resizeAnimation, nil]];
    group.duration = 0.7f;
    group.delegate = self;
    [group setValue:imageViewForAnimation forKey:@"imageViewBeingAnimated"];
    
    [imageViewForAnimation.layer addAnimation:group forKey:@"savingAnimation"];
    
    
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


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Pintor Pirado"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
