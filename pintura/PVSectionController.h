//
//  PVSectionController.h
//  PVAlpha
//
//  Created by Daniel Blazquez on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageControl.h"
#import "PVLayoutServer.h"
#import "PVImageView.h"
#import "GAITrackedViewController.h"

@interface PVSectionController : GAITrackedViewController  <PageControlDelegate, UIScrollViewDelegate>
@property (nonatomic, retain) UIScrollView *scrollview;
@property NSString *path;
@property CGRect p1Frame, p2Frame, p3Frame, p4Frame, p5Frame, p6Frame, p7Frame, p8Frame;
@property (nonatomic, retain) PageControl *pageControl;
@property double section;
@property NSURL *baseURL;
@property NSString *pageHeader, *imageSegue, *imageSegueTitle;
@property (nonatomic, retain) UIView *curtain;
@property (nonatomic, retain) UILabel *subTitle1;
@property (nonatomic, retain) PVLayoutServer *layout;

- (void) loadPageContentForPage: (int) page Section: (int) section AtFrame: (CGRect) frame OnView: (UIView*) view scrolls: (BOOL) scrolls;
- (void) handleSimpleImageTap:(UITapGestureRecognizer *)recognizer onImage:(PVImageView *)imageView onPage:(UIView *)page;
- (void) displayTitleOfPage:(int) page AtSection:(int) section InView:(UIView*)view;
- (void) printImage:(PVImageView *)imageView Named:(NSString*)imageName Legend:(NSString *)legend InView:(UIView *)page WithLink:(NSString *)link TapRecognizer:(UITapGestureRecognizer *)recog;
- (void) drawTimeline:(int) section onPage:(UIView*)page;
- (void) printColumFor:(NSArray*)images at:(UIView*)page withWidth:(double)width atX:(double)x Y:(double)y;
- (void) printRowFor:(NSArray*)images at:(UIView*)page withHeight:(double)height atX:(double)x Y:(double)y;
- (UIImage *)resizeImage:(UIImage*)image newSize:(CGSize)newSize;
@end
