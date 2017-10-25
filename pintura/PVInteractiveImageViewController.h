//
//  PVInteractiveImageViewController.h
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PVInteractiveImageViewController : UIViewController <UIScrollViewDelegate>
-(CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;
@property NSString *imageId, *navigationTitle;
@property float minimumZoomScale;

@end
